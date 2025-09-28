set -e

docker pull iamshaklain/sample-dotnet-aws

docker run -d -p 8080:8080 -p 8081:8081 --name sample-dotnet-aws iamshaklain/sample-dotnet-aws
