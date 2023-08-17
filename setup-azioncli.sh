#!/bin/sh 

environment=$1

if [ -z ${environment} ] ; then
    echo "inform the environment: 'linux', 'darwin'"
    return 0
else 
    echo informed parameter ${environment}
fi

echo binary download
curl -o azioncli https://downloads.azion.com/stage/${environment}/x86_64/azion
chmod 777 ./azion

echo creating apps directory 
sudo mkdir -p /opt/apps/

echo move binary 
sudo rm -rf /opt/apps/azion
sudo mv ./azion /opt/apps/

echo create symbolic link
sudo rm /usr/local/bin/azion
sudo ln -s /opt/apps/azion /usr/local/bin/azion

