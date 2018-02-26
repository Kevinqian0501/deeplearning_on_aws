# ensure system is updated and has basic build tools
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common
sudo apt-get --assume-yes install git

#CUDA TOOKkit 9.1
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

echo "export PATH=/usr/local/cuda-9.0/bin\${PATH:+:\${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc

nvcc --version #Checks CUDA version
nvidia-smi # Info about the detected GPUs


#CuDNN7
wget https://www.dropbox.com/s/nwl9er3myl6p09f/cudnn-9.0-linux-x64-v7.tgz
tar -xzf cudnn-9.0-linux-x64-v7.tgz 
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

#install virtualenv
sudo apt-get --assume-yes install python-pip python-dev
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 

# create project env
virtualenv -p python3.5 project
cd project
source bin/activate
export PS1="$"
pwd
python --version
which python
