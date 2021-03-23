#FROM ubuntu:20.04
FROM ubuntu

# Install default apps
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get upgrade -yq; \
    apt-get clean all
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -yq tzdata wget xz-utils nvidia-driver-460-server; \
    apt-get clean all

RUN ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime; \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN useradd miner -u 6666 -d /home/miner -m

RUN wget "https://github.com/PhoenixMinerDevTeam/PhoenixMiner/releases/download/5.5c/PhoenixMiner_5.5c_Linux.tar.gz"
RUN tar xvzf PhoenixMiner_5.5c_Linux.tar.gz -C /home/miner
RUN mv "/home/miner/PhoenixMiner_5.5c_Linux" "/home/miner/phoenixminer"
RUN sudo chmod +x /home/miner/phoenixminer/PhoenixMiner

# Define working directory.
WORKDIR /home/miner/
USER miner
CMD /home/miner/phoenixminer/PhoenixMiner \
        -pool stratum1+tcp://us-east.ezil.me:4444 \
        -pool2 stratum1+tcp://us-west.ezil.me:4444 \
        -proto 2 \
        -wal 0xd1B544A70BF87e1970B81192E7f384209063E113.zil1tzgtdgt29kh67qcgmhmvvvjnqcf4scw6erxwug \
        -coin etc \
