# This script is designed to work with ubuntu 16.04 LTS

# ensure system is updated and has basic build tools
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common
sudo apt-get --assume-yes install git


#CUDA® Toolkit 8.0
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo apt-get update
sudo apt-get -y install cuda
#add to path
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
echo  "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo  "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

source ~/.bashrc
nvcc --version # Checks CUDA version
nvidia-smi # Info about the detected GPUs

#cuDNN v6
wget https://www.dropbox.com/s/32u3dd58ac85d92/cudnn-8.0-linux-x64-v6.0.tgz
tar -xzf cudnn-8.0-linux-x64-v6.0.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

#tenserflow
#The libcupti-dev library, which is the NVIDIA CUDA Profile Tools Interface.
sudo apt-get -y install python-pip
sudo pip install --upgrade pip 
sudo apt-get -y  install libcupti-dev
sudo pip install tensorflow-gpu==1.3.0

#keras
sudo pip install keras==2.0.8

#jupyter
sudo apt-get update
sudo pip install jupyter

# run jupyter
sudo jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser &