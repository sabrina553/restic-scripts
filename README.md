# restic-scripts
My personal restic back-up scripts 

I wrote a nice README and it got lost in branch hell :) 

credit to github.com/linucksrox/restic-scripts/tree/main 

uniquely I have 3 nodes with various functions / limitations, and this script is an attempt of using input variables to discern between these scripts, while permiting unique requirements. 

### In essence

- Node 1  : ~ 300Gb Server, where I host docker stacks, their service's configuration files, and personal data...
- Node 2  : ~ 128Gb Raspberry-pi, where I run Technitium from my router, and is always-on, which allows for a nice intermidate back-up
- Node 3  : ~ 1TB My PC (linux), Where my pc is on/off, however provides a nice location for +100GB of photos, and the other personal data...

Hence these scripts hope to take advantage of restic (great software btw) to have periodic back-ups between nodes 1 -> 2, aswell as on-wake commands from 1,2 -> 3. 

Where my scripts have diverged from linucksrox and are unique, is the use of input and environment variables to specify between these nodes.

for example 

`./main.sh copy LOCAL RPI` will copy the snapshots from my server to my raspberry pi, and flexibility of 2^3 inputs. 

### Environment Variables 

for anyone hoping to replicate, future self included, a quick glance of the env.sh and gitignore should lend to the configuration of these scripts. 

moreover, and importantly as of the time of wrting, the local Identities directory stores sensitive data in plain text. Inshallah and good luck <3


### CronJobs (Server-side)
```bash
# Run restic backup at 6:30 and 18:30 every day
30 6,18 * * * bash /srv/restic-repo/scripts/main.sh backup LOCAL MAIN >> /srv/restic-repo/scripts/logs/restic_backup.log 2>&1
# run raspi copy of snapshots at 7:00 and 19:00 every day
0 7,19 * * * bash /srv/restic-repo/scripts/main.sh copy LOCAL RPI >> /srv/restic-repo/scripts/logs/restic_backup.log 2>&1

# Run restic check every Thursday at 14:00 (optionally schedule a system reboot in root's crontab 10 minutes before this runs >
0 14 * * 4 bash /srv/restic-repo/scripts/main.sh check LOCAL >> /srv/restic-repo/scripts/logs/restic_backup.log 2>&1
# Run restic check every Thursday at 14:30 (optionally schedule a system reboot in root's crontab 10 minutes before this runs >
30 14 * * 4 bash /srv/restic-repo/scripts/main.sh check RPI >> /srv/restic-repo/scripts/logs/restic_backup.log 2>&1
```
moreover, I found ultimately the best way to do asynchronous back-ups for sapphire, was to again utilise these scripts but by setting up an anacron system on my sapphire node, that then calls these script functions over ssh. 
```bash

@daily    10    ResticBackup  ./restic.sh backup
@weekly   15    ResticCheck   ./restic.sh check
@monthly  20    ResticPrune   ./restic.sh prune
```
In this instance restic.sh was a personalised script for the sapphire node
`cat resticBACKUP.sh | ssh node1 >> logs/restic_backup.log 2>&1`
similar to the main.sh in this (github) repository, I used a switch statement to essentially run this script in 3 different ways dependent on the input as you can see above, I don't believe it is neccesary for me publish these scripts. atleast at this time, I wanna take a break from restic for the time being. 

the RHS of the script is essentially just running ssh to node1 (through publickey) logging the output to a local file, then running a few sets of commands as resticFUNCTION.sh that are specific to my usecase, using the established functions of this repository 

```bash
#!/bin/sh
bash ./main.sh backup SAPPHIRE_IMMICH IMMICH 
bash ./main.sh copy RPI SAPPHIRE
```

### More examples
```bash
./main.sh backup <REPO> <METHOD> # Backup to the local repository, using method MAIN. as assigned in the env. "method" i,e what files are backed up is in configs and has strict but universal naming. 
./main.sh check <REPO> # verifies the validitiy of the local repository
./main.sh copy <sourceREPO> <destinationREPO> #copies the snapshots between two repositories ie 
./main.sh prune <REPO> # removes and prunes repositories as per a policy defined in the env file
./main.sh snapshots <REPO> #list snapshots in repo
```

### To-do
- verify I can use these snapshots to recover 
- not storing sensitive data in plain text would be great also
- how does bash auto-complete from terminal? if I'm making an ease-of-life script, it would be nice to make my life easier... albeit ideally I will never have to touch these scripts again for the case of general use :D
