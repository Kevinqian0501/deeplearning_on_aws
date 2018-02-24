FROM gpu_env:v1

WORKDIR  "/" 
RUN wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64
RUN dpkg -i cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64
RUN apt-key add /var/cuda-repo-9-1-local/7fa2af80.pub
RUN apt-get update --fix-missing \
	&& apt-get install -y cuda 
