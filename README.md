This docker image is for running sonarqube on unity3d projects.

It uses unityci/editor as a base.

To build for your unity version, you'd run something like this;

    export UNITY_VERSION=2020.1.13f1
    export IMAGE_VERSION=0.12
    docker build --build-arg UNITY_VERSION=$UNITY_VERSION -t shadowbert/unityci:$UNITY_VERSION-sonarqube-$IMAGE_VERSION .

The version of the image I'm using are found on [dockerhub](https://hub.docker.com/repository/docker/shadowbert/unityci).
Feel free to raise a PR or Issue if the version you need isn't there.
