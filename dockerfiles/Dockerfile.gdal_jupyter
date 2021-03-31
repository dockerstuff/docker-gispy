FROM chbrandt/gispy:gdal

MAINTAINER "Carlos H Brandt <carloshenriquebrandt.gmail>"

RUN python -m pip --no-cache-dir install jupyter

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

