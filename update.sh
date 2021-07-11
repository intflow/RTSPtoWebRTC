#!/bin/bash

sudo docker commit golang_RTSP2WebRTC intflow/vid_stream_server:rtsp2webrtc
sudo docker login docker.io -u kmjeon -p 1011910119a!
sudo docker tag vid_stream_server:rtsp2webrtc intflow/vid_stream_server:rtsp2webrtc
sudo docker push intflow/vid_stream_server:rtsp2webrtc

