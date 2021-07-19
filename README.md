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

Installed Python packages can be found at [pyproject.toml](./pyproject.toml)
