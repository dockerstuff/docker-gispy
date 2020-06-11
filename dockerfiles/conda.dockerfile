FROM continuumio/miniconda3

MAINTAINER "Carlos Brandt <carloshenriquebrandt at gmail>"

RUN DEBIAN_FRONTEND='noninteractive' apt-get update \
    && apt-get install -y git-core \
                          vim \
    && rm -rf /var/lib/apt/lists/*

RUN conda update -n base -c defaults -y conda \
    && conda config --env --add channels conda-forge \
    && conda install -y ipython \
                        fiona \
                        gdal \
                        geopandas \
                        matplotlib \
                        numpy \
                        pyproj \
                        rasterio \
                        scipy \
                        shapely \
    && conda clean --all 
