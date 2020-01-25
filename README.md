# Ombi

Simple docker image for Ombi without any bloat, built on the official debian image. Ombi runs as user `ombi` with `uid` and `gid` 3579.

## Usage

```sh
docker run --rm ghudiczius/ombi:<VERSION> \
  -p 3579:3579 \
  -v path/to/data:/data
```
