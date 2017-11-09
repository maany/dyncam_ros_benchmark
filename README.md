# dyncam-ros_benchmark

## Pre-requisites
- Get 2 machines with Ubuntu 16.04 or higher. (Technically should work with any distro, but I've tested it on Ubuntu 16.04 and 17.04)
- Make sure that both machines are on the same network and you are able to ping one of them from a terminal on the second machine.
- Install docker and start docker daemon on both machines. Instructions are [here](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
- Clone this repository on both machines

## Server Machine
1. Connect the Kinect2 sensor to the USB port
1. Change directory to the server folder in this repo ```cd dyncam_ros_benchmark/server```
1. Check the IP address[server_ip_address] of the server for the network interface that will be used to transfer kinect's data.[``` ip addr show```]
1. Start the server
  ```./run_server.sh --ip=$[server_ip_address]```
1. Start a local client to see data from the kinect
   ```./run_local_client.sh --type=[cloud|image]```
   
See the instructions in [run_server.sh](https://github.com/maany/dyncam-ros_benchmark/blob/master/server/run_server.sh) and [run_local_client.sh](https://github.com/maany/dyncam-ros_benchmark/blob/master/server/run_local_client.sh) for more details   
## Client Machine
1. Change firectory to the client folder in this repo. ```cd dyncam_ros_benchmark/client```
1. Check the IP address[client_ip_address] of the client for the network interface that will be used to receive kinect's data.[``` ip addr show```]
1. Make sure the server is still running
1. Start the remote client
  ```./run_client.sh --master=[server_ip_address] --host=[client_ip_address] --ip=$[client_ip_address] --type=[cloud|image]```
1. Start a local client to see data from the kinect
   ```./run_local_client.sh --type=[cloud|image]```
   
See the instructions in [run_client.sh](https://github.com/maany/dyncam-ros_benchmark/blob/master/client/run_client.sh)
