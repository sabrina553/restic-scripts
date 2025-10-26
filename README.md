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

`./copy.sh LOCAL RPI` will copy the snapshots from my server to my raspberry pi, and flexibility of 2^3 inputs. 

### Environment Variables 

for anyone hoping to replicate, future self included, a quick glance of the env.sh and gitignore should lend to the configuration of these scripts. 

moreover, and importantly as of the time of wrting, the local Identities directory stores sensitive data in plain text. Inshallah and good luck <3
