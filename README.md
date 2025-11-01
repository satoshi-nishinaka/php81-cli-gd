# php-cli-gd

## 概要
DockerHub上のComposerではext-gdを指定しているとComposerインストールが出来なかったので
PHP8.2-cli をベースに gd, zip のライブラリをインストールしたもの

Composerを使ったマルチステージングビルドのために利用する

### ビルド
```sh
$ docker compose -f docker-compose-arm64-v8.yml build
```

## DockerHub
- https://hub.docker.com/repository/docker/satoshiesp/php-cli-gd/general

```sh
$ docker push satoshiesp/php-cli-gd:8.2
```
