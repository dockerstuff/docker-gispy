FROM osgeo/gdal

MAINTAINER "Carlos H Brandt <carloshenriquebrandt.gmail>"

RUN DEBIAN_FRONTEND='noninteractive' apt-get update \
    && apt-get install -y python3-pip \
                          git-core \
                          vim \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install ipython \
                             fiona \
                             geopandas \
                             matplotlib \
                             numpy \
                             pyproj \
                             rasterio \
                             scipy \
                             shapely
