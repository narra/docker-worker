#!/bin/bash
set -x

## Install dependencies
apt-get install -y -qq unzip
apt-get install build-essential curl tar pkg-config
apt-get -y --force-yes install \
  autoconf \
  automake \
  build-essential \
  cmake \
  gawk \
  pkg-config

## Install morphodita.
cd /opt
git clone --depth 1 https://github.com/ufal/morphodita.git
cd morphodita/src
make
cd /opt

## Download czech model
wget https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11234/1-1836/czech-morfflex-pdt-161115.zip
unzip czech-morfflex-pdt-161115.zip
rm -rf czech-morfflex-pdt-161115.zip

## Download english model
wget https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11858/00-097C-0000-0023-68D9-0/english-morphium-wsj-140407.zip
unzip english-morphium-wsj-140407.zip
rm -rf english-morphium-wsj-140407.zip