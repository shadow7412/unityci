This docker image is for running sonarqube on unity3d projects.

It uses unityci/editor as a base.

To build for your unity version, you'd run something like this;

    export UNITY_VERSION=2020.1.13f1
    export IMAGE_VERSION=0.12
    docker build --build-arg UNITY_VERSION=$UNITY_VERSION -t shadowbert/unityci:$UNITY_VERSION-sonarqube-$IMAGE_VERSION .

The version of the image I'm using are found on [dockerhub](https://hub.docker.com/repository/docker/shadowbert/unityci).
Feel free to raise a PR or Issue if the version you need isn't there.

To actually use the image, you'll need to set up your pipelines.
Note: I use gitlab personally, but I'm sure the permise of these commands is translatable to whatever runners you are using. These hopefully would suffice to guide your pipeline modifications.

1. Set up your unity build as per [the instructions on the game.ci site](https://game.ci/docs/gitlab/getting-started)
2. Set $SONAR_PROJECT_KEY and $SONAR_HOST_URL according to your instance of sonarqube.
3. Run the following commands at the end of your build.

```
# Add dotnet to the path
 - "export PATH=\"$PATH:$HOME/.dotnet/tools\""

# Generate the solution and csproj files
 - chmod +x ./ci/generate_sln.sh && ./ci/generate_sln.sh

# dotnet freaks out if there are multiple csprojs in the working directory.
# so to avoid this issue, I just create a temporary directory to step into.
# As I'm specifying the sln, it doesn't matter to the build.
- mkdir sonar && cd sonar

# Finally, run sonarqube.
- "dotnet sonarscanner begin /k:\"$SONAR_PROJECT_KEY\" /d:sonar.login=\"$SONAR_TOKEN\" /d:\"sonar.host.url=$SONAR_HOST_URL\""
- "dotnet build ../*.sln"
- "dotnet sonarscanner end /d:sonar.login=\"$SONAR_TOKEN\""
```
