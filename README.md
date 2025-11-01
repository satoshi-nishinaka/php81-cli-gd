# php-cli-gd

## 概要
DockerHub上のComposerではext-gdを指定しているとComposerインストールが出来なかったので
PHP8.1-cli をベースに gd, zip のライブラリをインストールしたもの

Composerを使ったマルチステージングビルドのために利用する

## DockerHub
- https://hub.docker.com/repository/docker/satoshiesp/php-cli-gd/general

```
$ docker push satoshiesp/php-cli-gd:8.1
```

