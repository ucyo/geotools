Docker environment for climate researchers at KIT.

# Geotools Environment

Build environment
```bash
docker build --tag ucyo/geotools:latest .
```

Run interactive environment
```bash
docker run -it ucyo/geotools:latest
```

If a new package needs to be added, first run an interactive container session with appropriate mount
```bash
docker run -v $(pwd):/home/python/code -it ucyo/geotools:centos bash
```
and then install necessary package
```bash
poetry add <package_name>
```

Installed Python packages can be found at [pyproject.toml](./pyproject.toml).
