FROM ubuntu:16.04
WORKDIR /tmp
# Install Dependencies
RUN apt-get update && apt-get install build-essential -y && apt-get install wget libfontconfig1-dev libfreetype6-dev libx11-dev libxcursor-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxrandr-dev libxrender-dev -y
# OpenGL
RUN apt-get update && apt-get install freeglut3 freeglut3-dev binutils-gold g++ cmake libglew-dev mesa-common-dev build-essential libglew1.5-dev libglm-dev libqt4-opengl -y
# Install QT
RUN wget http://qt.mirror.constant.com/archive/qt/4.7/qt-everywhere-opensource-src-4.7.4.tar.gz && gunzip qt-everywhere-opensource-src-4.7.4.tar.gz && tar xvf qt-everywhere-opensource-src-4.7.4.tar
WORKDIR /tmp/qt-everywhere-opensource-src-4.7.4/
# Configure QT
RUN yes | ./configure -qt-gfx-vnc -opensource
RUN make install

ENV PATH="/usr/local/Trolltech/Qt-4.7.4/bin:${PATH}"
CMD ["/bin/bash"]