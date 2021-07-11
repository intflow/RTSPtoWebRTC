#!/bin/bash
#X11

#sudo bash attach_NAS_ftp.sh
sudo xhost +local:root

#Mount Data folders
sudo mkdir /DL_data_big
sudo mount 192.168.0.18:/DL_data_big /DL_data_big
#sudo mount 192.168.0.14:/NAS1 /NAS1

#Pull update docker image
docker pull intflow/vid_stream_server:rtsp2webrtc

#Run Dockers for CenterNet+DeepSORT
sudo docker run --name vid_stream_server \
--gpus all --rm -p 8083:8083 \
--mount type=bind,src=/home/intflow/works,dst=/works \
--mount type=bind,src=/DL_data_big,dst=/DL_data_big \
--net=host \
--privileged \
--ipc=host \
-it intflow/vid_stream_server:rtsp2webrtc /bin/bash
