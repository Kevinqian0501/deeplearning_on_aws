FROM gpu_env:v2

WORKDIR  "/" 
RUN apt-key add /var/cuda-repo-9-1-local/7fa2af80.pub
RUN apt-get update && apt-get install cuda 
