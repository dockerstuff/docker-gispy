ARG BASE_IMAGE=osgeo/gdal:ubuntu-full-3.2.3
FROM $BASE_IMAGE

MAINTAINER "Carlos H Brandt <carloshenriquebrandt.gmail>"

RUN DEBIAN_FRONTEND='noninteractive' apt-get update \
    && apt-get install -y python3-pip \
                          git-core \
                          libproj-dev \
                          vim \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install ipython \
                             fiona \
                             geopandas \
                             geoplot \
                             matplotlib \
                             numpy \
                             pyproj \
                             rasterio \
                             scipy \
                             shapely
