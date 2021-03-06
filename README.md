# Docker todo
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/nicholaswilde/todo)](https://hub.docker.com/r/nicholaswilde/todo)
[![Docker Pulls](https://img.shields.io/docker/pulls/nicholaswilde/todo)](https://hub.docker.com/r/nicholaswilde/todo)
[![GitHub](https://img.shields.io/github/license/nicholaswilde/docker-todo)](./LICENSE)
[![ci](https://github.com/nicholaswilde/docker-todo/workflows/ci/badge.svg)](https://github.com/nicholaswilde/docker-todo/actions?query=workflow%3Aci)
[![lint](https://github.com/nicholaswilde/docker-todo/workflows/lint/badge.svg?branch=main)](https://github.com/nicholaswilde/docker-todo/actions?query=workflow%3Alint)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

A multi-architecture image for [todo](https://github.com/prologic/todo).

## Architectures

* [x] `armv7`
* [x] `arm64`
* [x] `amd64`

## Dependencies

* None

## Usage

### docker cli

```bash
$ docker run -d \
  --name=todo-default \
  -e TZ=America/Los_Angeles `# optional` \
  -e PUID=1000    `# optional` \
  -e PGID=1000    `# optional` \
  -e THEME=ayu    `# optional` \
  -p 8000:8000 \
  --restart unless-stopped \
  nicholaswilde/todo
```

### docker-compose

See [docker-compose.yaml](./docker-compose.yaml).

## Configuration

|user | uid |
|----:|:---:|
| abc | 911 |

See [todo](https://github.com/prologic/todo#configuration) for more configuration options.

## Development

See [docs](https://nicholaswilde.io/docker-docs/development/).

## Troubleshooting

See [docs](https://nicholaswilde.io/docker-docs/troubleshooting).

## Pre-commit hook

If you want to automatically generate `README.md` files with a pre-commit hook, make sure you
[install the pre-commit binary](https://pre-commit.com/#install), and add a [.pre-commit-config.yaml file](./.pre-commit-config.yaml)
to your project. Then run:

```bash
$ pre-commit install
$ pre-commit install-hooks
```
Currently, this only works on `amd64` systems.

## License

[Apache 2.0 License](./LICENSE)

## Author
This project was started in 2021 by [Nicholas Wilde](https://github.com/nicholaswilde/).
