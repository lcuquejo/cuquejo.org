How to build:
```
docker build -t leonardocuquejo/cuquejo-org:{SOME_VERSION} -f docker/Dockerfile  .
```
How to run:
```
docker run -p 3000:3000 -d --restart=always leonardocuquejo/cuquejo-org:1.0
```