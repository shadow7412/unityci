ARG UNITY_VERSION="2021.2.15f1"
ARG IMAGE="unityci/editor"
ARG IMAGE_VERSION="0.17"
FROM $IMAGE:$UNITY_VERSION-base-$IMAGE_VERSION

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y apt-transport-https && apt-get update && apt-get install -y dotnet-sdk-6.0 && apt-get update && apt-get install -y openjdk-11-jre && apt-get -y install gnupg ca-certificates && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update && apt -y install mono-devel
RUN export FrameworkPathOverride=/opt/unity/Editor/Data/MonoBleedingEdge/
RUN dotnet tool install --global dotnet-sonarscanner
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*