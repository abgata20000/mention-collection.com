# https://mention-collection.com
- https://mention-collection.com

## Rails version
- 5.2.1

## Ruby version
- 2.5.1

## System dependencies
- MySQL(5.7~)

### Configuration
- オブジェクト指向を意識して書くこと
- DRYを意識して書くこと

## Rails settings
- bundleの実行
通常通り `bundle install` で `gem` のインストールをお願いします。

- 環境変数設定用に `.env.local` を作成
ローカルでのenvの設定を変更したい場合は`.env.local`を作成して任意の設定を上書きしてください。
※環境変数の変更後反映するにはRailsの再起動が必要です。

## Database settings
- database.ymlを作成します
```
cp config/database.sample.yml config/database.yml
```
中身はご自身の環境に合わせて適宜変更ください
DATABASEの作成もご自身の環境に合わせて作成してください

- ridgepole を利用しています。
DBスキーマ反映用にタスクを作成しているので
```
bundle exec rails db:ridgepole
```
で反映されます。

## yarnでjsファイルをダウンロード
```
yarn install
```

## railsの起動
```
bundle exec rails s
```


## Other settings
