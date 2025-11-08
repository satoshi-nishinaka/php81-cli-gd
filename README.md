# php-cli-gd

## 概要
DockerHub上のComposerではext-gdを指定しているとComposerインストールが出来なかったので
PHP8.2-cli をベースに gd, zip のライブラリをインストールしたもの

Composerを使ったマルチステージングビルドのために利用する

### ビルド
ローカル検証用の arm64/amd64 イメージは docker compose でビルドできます。どちらも `php82-cli-gd:<platform>` というタグを付けています。

```sh
# arm64 (Apple Silicon / Mac)
docker compose -f docker-compose-arm64-v8.yml build  # php82-cli-gd:linux-arm64-v8

# amd64 (EC2 想定)
docker compose -f docker-compose-amd64.yml build     # php82-cli-gd:linux-amd64
```

### タグ命名
- Mac (arm64): `satoshiesp/php-cli-gd:8.2-linux-arm64-v8`
- EC2 (amd64): `satoshiesp/php-cli-gd:8.2-linux-amd64`

### DockerHub へ push する
`scripts/buildx-amd64.sh` は DockerHub 向けに `PLATFORM_TAGS`（既定で amd64 / arm64-v8）を順次ビルドして push します。`DOCKERHUB_REPOSITORY` が未指定の場合は `satoshiesp/php-cli-gd` になります。

```sh
# 両プラットフォームを push
DOCKERHUB_REPOSITORY=satoshiesp/php-cli-gd make publish-dockerhub-all

# 片方だけ
make publish-dockerhub-amd64
make publish-dockerhub-arm64-v8
```

DockerHub へログインする必要がある場合は `DOCKERHUB_USERNAME` と `DOCKERHUB_TOKEN`（または `DOCKERHUB_PASSWORD`）を設定してください。push 後は `docker run --rm --platform <platform> satoshiesp/php-cli-gd:<tag> uname -m` で `x86_64` / `aarch64` を確認します。

## DockerHub
- https://hub.docker.com/repository/docker/satoshiesp/php-cli-gd/general

```sh
$ docker push satoshiesp/php-cli-gd:8.2-linux-amd64
$ docker push satoshiesp/php-cli-gd:8.2-linux-arm64-v8
```
