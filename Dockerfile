FROM golang:1.14.15-alpine3.13 as build
ARG VERSION
ARG COMMIT
ENV GO111MODULE on
WORKDIR /go/src/github.com/prologic/todo
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    git=2.30.2-r0 \
    make=4.3-r0 \
    build-base=0.5-r2 && \
  echo "**** download todo ****" && \
  mkdir /app && \
  git clone "https://github.com/prologic/todo.git" /go/src/github.com/prologic/todo && \
  git reset --hard "${COMMIT}" && \
  go get -v -d && \
  go install -v && \
  go build . && \
  echo "**** cleanup ****" && \
  rm -rf \
    ./*.md \
    .github \
    screenshots

FROM ghcr.io/linuxserver/baseimage-alpine:3.14
ARG BUILD_DATE
ARG VERSION
ENV GOPATH /go
# hadolint ignore=DL3048
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="nicholaswilde"
COPY --from=build --chown=abc:abc /go /go
COPY root/ /
RUN \
  mkdir /data && \
  ln -s /go/src/github.com/prologic/todo / && \
  chown -R abc:abc \
    /data \
    /go
WORKDIR /go/src/github.com/prologic/todo
EXPOSE 8000/tcp
VOLUME \
  /data \
  /todo
