# Python-GIS-container

Docker container with Python GIS libraries pre-installed.

## Running Container

```bash
docker run --rm -it --volume '/tmp:/tmp' --volume '/mnt:/mnt' --volume '/home:/home' --volume "$PWD:$PWD" --workdir "$PWD" ghcr.io/vogelerlab/python-gis-container:main python3
```
