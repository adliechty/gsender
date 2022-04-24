FROM ubuntu:16.04

ARG OPENCV_VERSION
ARG NODEJS_MAJOR_VERSION
ARG WITH_CONTRIB

ENV OPENCV4NODEJS_DISABLE_AUTOBUILD=1

RUN apt-get update && \
apt-get install -y build-essential curl && \
apt-get install -y --no-install-recommends wget unzip git python cmake vim && \
curl -sL https://deb.nodesource.com/setup_${NODEJS_MAJOR_VERSION}.x | bash && \
apt-get install -y nodejs && node -v && npm -v && \
rm -rf /var/lib/apt/lists/* && \
mkdir opencv && \
cd opencv

RUN wget https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.zip --no-check-certificate -O opencv-${OPENCV_VERSION}.zip
#RUN wget https://github.com/Itseez/opencv/archive/refs/heads/${OPENCV_VERSION}.zip --no-check-certificate -O opencv-${OPENCV_VERSION}.zip
RUN apt update
RUN apt install -y build-essential
RUN unzip opencv-${OPENCV_VERSION}.zip && \
if [ -n "$WITH_CONTRIB" ]; then \
	wget https://github.com/opencv/opencv_contrib/archive/refs/heads/${OPENCV_VERSION}.zip --no-check-certificate -O opencv_contrib-${OPENCV_VERSION}.zip; \
	unzip opencv_contrib-${OPENCV_VERSION}.zip; \
fi && \
mkdir opencv-${OPENCV_VERSION}/build && \
cd opencv-${OPENCV_VERSION}/build && \
cmake_flags="-D CMAKE_BUILD_TYPE=RELEASE \
  -D BUILD_EXAMPLES=OFF \
	-D BUILD_DOCS=OFF \
	-D BUILD_TESTS=OFF \
	-D BUILD_PERF_TESTS=OFF \
	-D BUILD_JAVA=OFF \
	-D BUILD_opencv_apps=OFF \
	-D BUILD_opencv_aruco=OFF \
	-D BUILD_opencv_bgsegm=OFF \
	-D BUILD_opencv_bioinspired=OFF \
	-D BUILD_opencv_ccalib=OFF \
	-D BUILD_opencv_datasets=OFF \
	-D BUILD_opencv_dnn_objdetect=OFF \
	-D BUILD_opencv_dpm=OFF \
	-D BUILD_opencv_fuzzy=OFF \
	-D BUILD_opencv_hfs=OFF \
	-D BUILD_opencv_java_bindings_generator=OFF \
	-D BUILD_opencv_js=OFF \
  -D BUILD_opencv_img_hash=OFF \
  -D BUILD_opencv_line_descriptor=OFF \
  -D BUILD_opencv_optflow=OFF \
  -D BUILD_opencv_phase_unwrapping=OFF \
	-D BUILD_opencv_python3=OFF \
	-D BUILD_opencv_python_bindings_generator=OFF \
	-D BUILD_opencv_reg=OFF \
	-D BUILD_opencv_rgbd=OFF \
	-D BUILD_opencv_saliency=OFF \
	-D BUILD_opencv_shape=OFF \
	-D BUILD_opencv_stereo=OFF \
	-D BUILD_opencv_stitching=OFF \
	-D BUILD_opencv_structured_light=OFF \
	-D BUILD_opencv_superres=OFF \
	-D BUILD_opencv_surface_matching=OFF \
	-D BUILD_opencv_ts=OFF \
	-D BUILD_opencv_xobjdetect=OFF \
	-D BUILD_opencv_xphoto=OFF \
	-D CMAKE_INSTALL_PREFIX=/usr/local" && \
if [ -n "$WITH_CONTRIB" ]; then \
  cmake_flags="$cmake_flags -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VERSION}/modules"; \
fi && \
echo $cmake_flags && \
cmake $cmake_flags .. && \
make -j $(nproc) && \
make install && \
sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf' && \
ldconfig && \
cd ../../../ && \
rm -rf opencv && \
npm install -g opencv4nodejs --unsafe-perm && \
apt-get purge -y build-essential unzip && \
apt-get autoremove -y --purge
WORKDIR /root/
RUN git clone https://github.com/creationix/nvm.git ~/.nvm
WORKDIR /root/.nvm

RUN git checkout `git describe --abbrev=0 --tags`
WORKDIR /root
RUN export NVM_DIR="$HOME/.nvm"

#https://github.com/justadudewhohacks/opencv4nodejs/issues/775
RUN git clone https://github.com/adliechty/gsender.git
RUN export OPENCV4NODEJS_AUTOBUILD_FLAGS=-DBUILD_LIST=core,imgproc,imgcodecs,videoio,highgui,video,calib3d,features2d,objdetect,dnn,ml,flann,photo,stitching,gapi

#RUN apt update
#RUN apt install build-essential
#RUN . /root/.nvm/nvm.sh
#RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
WORKDIR /root/gsender
#RUN nvm install 14
#RUN nvm use 14
########RUN npm install npm -g
#RUN npm install -g eslint
#RUN npm install eslint-config-trendmicro -f -g
#RUN npm install babel-eslint -g
#RUN npm install
#RUN npm install child_process
#npm install --save opencv-build
#npm install --save opencv4nodejs
#RUN npm run prepare
#RUN npm run build

#Try open cv 4.5.0 4.5.1 uses different form of Tracker libarires.
