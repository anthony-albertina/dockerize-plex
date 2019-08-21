# Docker implementation of Plex Media Server

### This repo has the scripts to easily start your own Plex Media Server. 
### It mounts a network drive with the media and pops open the webpage
### Furthermore, it is set to start at boot and persist your configs

To start run:
```bash
 git clone https://github.com/anthony-albertina/dockerize-plex.git
 chmod -R +x dockerize-plex # Makes the scripts executable
 cd dockerize-plex
 ./setup_plex.sh
```

This will pull down any dependencies and pop open the Plex webpage
Log in and configure your media. If you wish to persist the state run:
```bash
 ./persist_plex.sh
```

To stop and start later on run:
```bash
 sudo service plex start
 sudo service plex stop
```
![plex](/plex-server.PNG)
