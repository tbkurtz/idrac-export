docker build --network host -t idrac-export .
docker stop idrac-export
docker rm idrac-export
#docker run -it -v c:\users\tom\idrac-export\data:/app --name idrac-export idrac-export
docker run -d -v c:\users\tom\idrac-export\data:/app --name idrac-export idrac-export