#!/bin/bash
nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[3]=1300
nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=150
nvidia-settings -a [gpu:0]/GPUFanControlState=1
nvidia-settings -a [fan:0]/GPUTargetFanSpeed=35
sudo nvidia-smi -pm 1
sudo nvidia-smi -pl 80

docker run --gpus all -it --rm --name phoenixminer phoenixminer:5.5c 

#docker run --gpus all -it --rm --name phoenixminer \
#	phoenixminer:5.5c \
#	/home/miner/phoenixminer/PhoenixMiner \
#	-pool stratum1+tcp://us-east.ezil.me:4444 \
#       -pool2 stratum1+tcp://us-west.ezil.me:4444 \
#	-proto 2 \
#	-wal 0xd1B544A70BF87e1970B81192E7f384209063E113.zil1tzgtdgt29kh67qcgmhmvvvjnqcf4scw6erxwug \
#	-coin etc \
