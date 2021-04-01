# GIS-Python tools

Containers for GIS processing with Python.


### Dockerfiles
You'll find a set of dockerfiles inside the [dockerfiles](dockerfiles/) directory,
all providing some sort of geo-processing tools.
All of them with GDAL and Python installed:

* `Dockerfile.gdal` : GDAL + everyday Python libs (shapely, fiona, geopandas, etc)
* `Dockerfile.gdal_jupyter`: `Dockerfile.gdal` + Jupyter-LabHub


#### Basic container
The simplest container to run here goes:
```bash
% docker run -it --rm chbrandt/gispy:gdal
```
, and you should land in the container shell (`-it`).
Exit (`ctrl-d`) and the container will be remove too (`--rm`)

To have some (geo) data in there, you can mount a volume (`-v`),
```bash
% docker run -it --rm --name gispy \
    -v $PWD:/mnt/data \
    chbrandt/gispy:gdal
```
, where current working directory (`$PWD`) is being mapped to container's `/mnt/data`.


#### Jupyter container
In the following examples, localhost' port `8000` is being used to run the container
running Jupyter ("gdal_jupyter").

To run the image using the default user `user:123456`,
```bash
% docker run -it --rm --name jupyterhub \
    -p 8000:8000 -v $PWD:/mnt/data \
    chbrandt/gispy:jupyterhub
```

To run the image using GitHub authentication,
```bash
% docker run -it --rm --name gispy_jupyterhub \
    -p 8000:8000 -v $PWD:/mnt/data \
    -e GITHUB_CLIENT_ID=<your-github-client-id> \
    -e GITHUB_CLIENT_SECRET=<your-github-client-secret> \
    chbrandt/gispy:jupyterhub
```
