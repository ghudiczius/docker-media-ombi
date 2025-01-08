# Ombi

Simple docker image for Ombi without any bloat, built on the official debian image. Ombi runs as user `ombi` with `uid` and `gid` `1000` and listens on port `5000`.

## Usage

```sh
docker run --rm ghudiczius/ombi:<VERSION> \
  -p 5000:5000 \
  -v path/to/data:/data
```

or

```sh
docker run --rm registry.gitlab.jmk.hu/media/ombi:<VERSION> \
  -p 5000:5000 \
  -v path/to/data:/data
```
