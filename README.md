# WEB+DB PRESS Vol.68「Rubyわくわくナビ」利用コード

Ruby わくわくナビ最終回「データで見るRubyGemsの世界」で利用したコードです

## ディレクトリ構成

### lib/
クローラと、収集したデータの格納のための Sequel モデル定義

#### lib/models/
データ処理のための ActiveRecord モデル定義と、マイグレーションファイル

### scripts/
各種データ解析を行うスクリプト

#### scripts/importer/
Sequel データから ActiveRecord データへの移行を行うスクリプト

### Rakefile
データクローリングのための Rake タスク

### data/
各種解析データと、可視化のためのスクリプト

### db/
収集データ用 sqlite3 ファイル

## Usage

### データクローリング

1. `$ bundle exec rake store:titles`

    `gem list -r` コマンドで得られるすべての RubyGems 名を sqlite に保存

2. `$ bundle exec rake store:information`

    すべての RubyGems の基礎情報を[Gem Methods - RubyGems.org API](http://guides.rubygems.org/rubygems-org-api/#gem)のAPIから取得

3. `$ bundle exec rake store:version`

    すべての RubyGems のバージョン情報を[Gem Version Methods - RubyGems.org API](http://guides.rubygems.org/rubygems-org-api/#gemversion)のAPIから取得
