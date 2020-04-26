#!/bin/bash
set -x

## Install ffmpeg
cd /opt
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
tar xvf ffmpeg-release-amd64-static.tar.xz
cp ffmpeg-4.2.2-amd64-static/ffmpeg /usr/bin/ffmpeg
cp ffmpeg-4.2.2-amd64-static/ffprobe /usr/bin/ffprobe