ARG UNITY_VERSION="2020.1.13f1"
ARG IMAGE="unityci/editor"
ARG IMAGE_VERSION="0.12"
FROM $IMAGE:$UNITY_VERSION-base-$IMAGE_VERSION
RUN apt-get update \
  && apt-get install -y openjdk-11-jre \
  && rm -rf /var/lib/apt/lists/*
RUN /opt/unity/Editor/Data/NetCore/Sdk-*/dotnet tool install --global dotnet-sonarscanner

