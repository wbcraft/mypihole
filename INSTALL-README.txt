#  Right now this only works on Raspbian because I'm lazy.  
#  However, this assumes you do NOT have docker installed and will install everything needed for it to run properly.  
#  Maybe I'm not THAT lazy... :-P
#  You can copy/pasta everything in the install section

#  CONFIGURE:
#  add/uncomment the following to /etc/apt/sources.list.d/raspi.list
#  You'll have to modify this based on the codename of your distribution.  No big deal, right?.... right?
#  Okay, that means if you have buster, change bookworm to buster.  or whatever.

deb http://archive.raspberrypi.com/debian/ bookworm main
deb-src http://archive.raspberrypi.com/debian/ bookworm main
deb http://archive.raspbian.org/raspbian bookworm main contrib non-free
deb-src http://archive.raspbian.org/raspbian bookworm main contrib non-free



#  INSTALL:

 sudo apt-get update
 sudo apt-get install ca-certificates curl
 sudo install -m 0755 -d /etc/apt/keyrings
 sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
 sudo chmod a+r /etc/apt/keyrings/docker.asc

 echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin net-tools

#  POST INSTALL:
#  Add your username to the docker group by using the following command:
#  sudo usermod -aG docker <yourusername>
#  Eh, just reboot after this.  Or logout and login.  Either way.


git clone git@github.com:/wbcraft/mypihole.git

cd mypihole

docker compose up -d


#
