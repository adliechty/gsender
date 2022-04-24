apt update
apt install build-essential -y
. /root/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
cd /root/gsender

#nvm install 14
#nvm use 14

export PATH=/home/node/.npm-global/bin:$PATH
export NPM_CONFIG_PREFIX=/home/node/.npm-global

npm install -g eslint
npm install eslint-config-trendmicro -f -g
npm install babel-eslint -g
npm install child_process -g
npm i -g opencv-build
npm i -g opencv4nodejs --unsafe
npm install opencv4nodejs
npm install child_process

#npm install --save opencv-build
#npm install --save opencv4nodejs

npm install
npm run prepare
npm run build


#Things that i'm trying
apt-get install -y libopencv-dev
npm install opencv

# Tried opencv 4.1.3 with nodejs 17
# Tried opencv 4.5.3 with nodejs 14
   # with export CXXFLAGS="-std=c++14 -Wno-c++11-narrowing"


#Tried opencv 4.5.0, no go

#npm i -g n
#n 15.11.0
#n (select version)
#npm i -g npm@6.14.11
#npm i -g opencv-build     --Gives error, but --save doesn't
#npm i -g opencv4nodejs
