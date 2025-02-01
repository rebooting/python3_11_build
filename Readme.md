
# Python 3.11.9 Build Project

This project provides Docker-based build scripts to compile Python 3.11.9 from source and package it as a portable ZIP file for Ubuntu 24.04.
It's an alternative me to using deadsnakes PPA or other package managers to install Python on Ubuntu 24.04.

## Prerequisites

- Docker
- Make

## Usage

### Building Python

1. Build the Docker image:
```sh
make build
```

2. Extract the compiled Python package:
```sh
make extract
```

This will create a `python3.11.9.zip` file in your current directory containing the compiled Python installation.

### Cleaning Up

To remove the Docker image and clean up resources:
```sh
make clean
```

## Details

- Base image: Ubuntu 24.04
- Python version: 3.11.9
- Output: Compiled Python installation in `/usr/local/python3.11` packaged as `python3.11.9.zip`
- Build includes optimizations enabled
- All necessary development dependencies are included in the build process

## Makefile Commands

- `make build`: Builds the Docker image with Python compilation
- `make extract`: Extracts the compiled Python ZIP file from the container
- `make clean`: Removes the Docker container and cleans up system resources

