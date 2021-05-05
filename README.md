# GIS-Python tools

Docker images for GIS processing with Python.

All containers here extend the one provided by OSGeo with GDAL installed,
[osgeo/gdal](https://hub.docker.com/r/osgeo/gdal).

Images built from [dockerfiles](#-dockerfiles) here defined are available
in the DockerHub under `chbrandt/gispy`

- [https://hub.docker.com/r/chbrandt/gispy](https://hub.docker.com/r/chbrandt/gispy)

Especifically, the following tags are associated to dockerfiles in here:

- [gispy:gdal](dockerfiles/Dockerfile)
    * `chbrandt/gispy:gdal-3.2.0`
    * `chbrandt/gispy:gdal`
    * `chbrandt/gispy:latest`

- [gispy:jupyterhub](dockerfiles/Dockerfile.jupyterhub)
    * `chbrandt/gispy:jupyterhub`


### Dockerfiles
Inside the [dockerfiles/](dockerfiles/) directory you'll find a set of dockerfiles
providing GDAL + Python-3 geo-processing/data-analysis tools/libraries.

For instance, two Docker image/files are provided:

- [gispy:gdal](dockerfiles/Dockerfile)
    * add the following Python-3 libraries and dependencies
        * ipython + pip
        * fiona
        * geopandas
        * shapely
        * scipy/numpy/matplotlib/etc

- [gispy:jupyterhub](dockerfiles/Dockerfile.jupyterhub)
    * inherit _FROM_ gispy:gdal
    * add JupyterHub
        - default username: `user`, password `123456`


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
