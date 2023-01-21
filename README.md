## Ruby の Lambda を Serverless Framework で作る

### 準備

名前変更

```yaml:serverless.yml
service: 好きな名前に
```

`.env` ファイル追加

```
# .env
AWS_ACCESS_KEY_ID=xxx
AWS_SECRET_ACCESS_KEY=yyy
```

Docker 起動

```
$ docker compose build
$ docker compose up -d
```

### コマンド

```
# package 作成
$ docker compose run --rm serverless sls package

# deploy
$ docker compose run --rm serverless sls deploy
```
