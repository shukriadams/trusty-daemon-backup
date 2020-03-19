# builds container from current tag. pushes to dockerhub if credential provided as env variables
TAG=$(git describe --tags --abbrev=0) &&

# required to disable tzdata blocking install
export DEBIAN_FRONTEND=noninteractive &&

docker build -t shukriadams/trusty-daemon-backup . &&

docker tag shukriadams/trusty-daemon-backup:latest shukriadams/trusty-daemon-backup:$TAG &&

if [ ! -z "${DOCKER_USER}" ]; then

    if [ ${#DOCKER_PASS} -eq 0 ]; then
        echo "DOCKER_PASS not set, push failed"
        exit 1;
    fi

    docker login -u $DOCKER_USER -p $DOCKER_PASS &&
    docker push shukriadams/trusty-daemon-backup:$TAG 

fi
