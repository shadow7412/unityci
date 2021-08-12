This docker image is for running sonarqube on unity3d projects.

It uses unityci/editor as a base.

To build for your unity version, you'd run something like this;

    export UNITY_VERSION=2020.1.13f1
    export IMAGE_VERSION=0.12
    docker build --build-arg UNITY_VERSION=$UNITY_VERSION -t shadowbert/unityci:$UNITY_VERSION-sonarqube-$IMAGE_VERSION .

