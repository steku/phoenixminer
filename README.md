# Pheonix Miner Docker Container

This repo holds a dockerfile and script to run the container image.

The container uses nvidia drivers and runs as a non-privileged user.

The docker file defaults to my mining info but can be overridden with the example from the bash script.

The script sets my overclocking settings outside the container so it does not required root.

The settings are for a NVIDIA 1060 3G card
