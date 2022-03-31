ARG UNITY_VERSION="2021.2.15f1"
ARG IMAGE="unityci/editor"
ARG IMAGE_VERSION="0.17"
FROM $IMAGE:$UNITY_VERSION-base-$IMAGE_VERSION

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update && apt-get install -y dotnet-sdk-6.0
RUN apt-get update && apt-get install -y openjdk-11-jre
RUN apt-get -y install gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt -y install mono-devel
RUN export FrameworkPathOverride=/opt/unity/Editor/Data/MonoBleedingEdge/
RUN dotnet tool install --global dotnet-sonarscanner