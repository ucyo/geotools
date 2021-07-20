# Geotools
Docker environment for climate researchers at KIT.
Installed Python packages can be found at [pyproject.toml](./pyproject.toml).

## Running locally

- Build environment
```bash
docker build --tag ucyo/geotools:latest <folder>
```

- Run interactive environment
```bash
docker run -it ucyo/geotools:latest
```

## Running at a HPC Environment (via `enroot`)
Running a Docker container in an HPC environment is currently a bit of a hassle since there are several safety concerns.
But these concerns can be eliminated using [`enroot`](https://github.com/NVIDIA/enroot).
Enroot works in three phases:

1. Downloading the container (using `enroot import`)
2. Mounting the container (using `enroot create`)
3. Run an application within the container (using `enroot start`)

If the container is no more needed it can be unmounted (using `enroot remove`).
The `centos` container of this environment can be used with `enroot` following these commands:

- Downloading the container
```bash
enroot import docker://ucyo/geotools:centos
```

- Mounting the container (defined by `$ENROOT_DATA_PATH`)
```bash
enroot create --name geotools ucyo+geotools+centos.sqsh
```

- Run an application within the container like `python` in read/write mode
```bash
enroot start --rw geotools python
```

- After all the hard work remove the mount
```bash
enroot remove geotools
```

## Maintaining the Container

- Add a new package
If a new package needs to be added, first run an interactive container session with appropriate mount
```bash
docker run -v $(pwd):/home/python/code -it ucyo/geotools:latest bash
```
and then install necessary package
```bash
poetry add <package_name>
```

- Generate a `requirements.txt` from a `pyproject.toml`
```bash
cd <folder> # folder with pyproject.toml file
poetry export -f requirements.txt --output requirements.txt
```
