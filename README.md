Docker environment for climate researchers at KIT.

# Geotools Environment

- Build environment
```bash
docker build --tag ucyo/geotools:latest <folder>
```

- Run interactive environment
```bash
docker run -it ucyo/geotools:latest
```

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

Installed Python packages can be found at [pyproject.toml](./pyproject.toml).
