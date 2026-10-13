# restic-scripts

My [restic](https://restic.net/) backup scripts: one entry point, `main.sh`, that runs backup, check, copy, prune and snapshot commands against any of my repositories, chosen by name on the command line.

Based on [linucksrox/restic-scripts](https://github.com/linucksrox/restic-scripts). Where mine differ is that every command takes the repository (and, for backups, the file set) as arguments, so one set of scripts serves several machines instead of one copy per machine.

## How it fits together

| Repository name | Where it lives | Holds |
| --- | --- | --- |
| `LOCAL` | On the server itself | Short history of the `MAIN` set (fast restores, little disk) |
| `SAPPHIRE` | Offsite PC | Long history of the `MAIN` set |
| `SAPPHIRE_IMMICH` | Offsite PC | The `DATA` set (photos and other personal data) |

| File set | What it backs up |
| --- | --- |
| `MAIN` | Docker config, volumes and database dumps (live database folders are excluded; they are restored from the dumps) |
| `DATA` | The data directory, minus re-downloadable files |

The server backs up to `LOCAL` on a schedule. The PC is not always on, so it does its part when it wakes: an anacron job on the PC runs these scripts on the server over SSH, backing up `DATA` and using `restic copy` to move snapshots into the PC's repositories.

## Usage

```bash
./main.sh backup    <REPO> <SET>    # e.g. ./main.sh backup LOCAL MAIN
./main.sh check     <REPO>
./main.sh copy      <SOURCE> <DEST> # copy snapshots between repositories
./main.sh prune     <REPO>          # forget and prune using the repo's policy in env.sh
./main.sh snapshots <REPO>
./main.sh remove    <REPO> <ID>     # forget one snapshot
```

Each backup writes `state/last-backup-<REPO>-<SET>` with restic's exit code and a timestamp, so a separate check can alert when a backup fails or stops running. restic exits `3` when a snapshot was made but some files could not be read, which is easy to miss in a log.

## Setting it up

1. **Repositories and passwords:** for each repository, put its location in `identities/<NAME>_REPO` and its password in `identities/<NAME>_PASSWORD` (both git-ignored; make them readable by root only).
2. **File sets:** copy each `configs/*.example` to the same name without `.example` and edit the paths. The real files are git-ignored because they describe the machine.
3. **Policies:** retention per repository is in `functions/env.sh`.
4. **Schedule**, for example in root's crontab:

   ```bash
   30 6,18 * * * bash /path/to/restic-scripts/main.sh backup LOCAL MAIN >> /path/to/restic-scripts/logs/restic_backup.log 2>&1
   0 14 * * 4    bash /path/to/restic-scripts/main.sh check LOCAL       >> /path/to/restic-scripts/logs/restic_backup.log 2>&1
   ```

## What I learnt

- **A backup is only as good as its last restore and its last alert.** The scripts ran happily for months; recording each exit code and checking it from elsewhere is what turns "probably fine" into "known fine".
- **Back up dumps, not live database files.** Copying a running database's files gives you a snapshot that may not open. Dumping first and excluding the live folders is smaller and restores cleanly.
- **Keep the long history where the disk is.** The server keeps a week or so; the PC with the big disk keeps years. `restic copy` makes that split cheap.
- **Bash name references** (`declare -n REPO=${1}_REPOSITORY_FILE`) let one script pick its variables from an argument, which is what made the per-machine copies unnecessary.
- **Keep machine-specific paths out of a public repo** from the start; it is far easier than rewriting history afterwards.

## What I would do better

- Test a full restore regularly, not just `restic check`.
- Store passwords in something better than plain-text files (a root-only keyring or a secrets manager).
- Validate arguments: an unknown repository name currently fails with an unhelpful restic error.
- Add `set -euo pipefail` and run everything through [ShellCheck](https://www.shellcheck.net/).
- Structured, rotated logs instead of one appended file, and shell completion for the repository names.
