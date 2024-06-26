
docker build -t cyber_rt_base -f ./Dockerfile.ubuntu . 
docker build -t cyber_rt:v7.0.0 -f ./Dockerfile.cyber . --build-arg CYBER_RT_VERSION=7.0.0
