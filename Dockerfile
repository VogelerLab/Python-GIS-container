# Author: Daniel Rode


# https://docs.docker.com/reference/dockerfile/


FROM alpine:edge

LABEL Author="Daniel Rode"

# Install Alpine Linux packages for building Python libraries
RUN ash <<'EOF'
    set -e  # Exit on error

    apk add --no-cache \
        R \
        R-dev \
        g++ \
        gcc \
        gdal-dev \
        geos-dev \
        make \
        pdal-dev \
        proj-dev \
        proj-util \
        py3-pip \
        python3-dev \
    ;
EOF

# Build and download Python libraries via pip
RUN ash <<'EOF'
    set -e  # Exit on error

    python3 -m venv /usr/local/pylib
    source /usr/local/pylib/bin/activate
    pip install \
        gdal \
        geopandas \
        pathos \
        pdal \
        rasterio \
        rasterstats \
        rpy2 \
        scikit-learn \
        seaborn \
        xmltodict \
    ;
EOF

# Add Python venv and utility scripts to path
ENV PATH="/usr/local/pylib/bin:$PATH"
