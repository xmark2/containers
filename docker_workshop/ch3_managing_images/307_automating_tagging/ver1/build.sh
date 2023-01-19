set -ex

USER='xmark2'
SERVICENAME=basic-app

version=`cat VERSION`
echo "version: $version"

docker build -t $USER/$SERVICENAME:$version .