
docker build --tag=hemanthhr/proj4 .
docker push hemanthhr/proj4:latest
#kubectl set image deployment/udacity-deployment scaredcat/udacity-kube:$buildtag
