mvn clean install
mvn package docker:build
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
git add VERSION 
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag demovana/nfv:latest demovana/nfv:$version
docker push demovana/nfv:latest
docker push demovana/nfv:$version
