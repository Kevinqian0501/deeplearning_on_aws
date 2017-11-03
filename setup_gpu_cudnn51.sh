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
echo "export PATH=/usr/local/cuda-8.0/bin\${PATH:+:\${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc

nvcc --version # Checks CUDA version
nvidia-smi # Info about the detected GPUs


# cuDNN v5.1
wget https://www.dropbox.com/s/636xwrg3kgs5ylm/cudnn-8.0-linux-x64-v5.1.tgz

tar -xzf cudnn-8.0-linux-x64-v5.1.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/


#The libcupti-dev library, which is the NVIDIA CUDA Profile Tools Interface.
sudo apt-get -y install python-pip
sudo pip install --upgrade pip
sudo apt-get -y  install libcupti-dev

#jupyter
sudo apt-get update
sudo pip install jupyter
