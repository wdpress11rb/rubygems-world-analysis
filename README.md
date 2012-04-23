# WEB+DB PRESS Vol.68「Rubyわくわくナビ」利用コード

[WEB+DB PRESS Vol.68｜gihyo.jp … 技術評論社](http://gihyo.jp/magazine/wdpress/archive/2012/vol68 "WEB+DB PRESS Vol.68｜gihyo.jp … 技術評論社")

Ruby わくわくナビ最終回「データで見るRubyGemsの世界」で利用したコードです

Ruby 1.9.3 で動作を確認しています

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

    すべての RubyGems の基礎情報を [Gem Methods - RubyGems.org API](http://guides.rubygems.org/rubygems-org-api/#gem) の API から取得

3. `$ bundle exec rake store:version`

    すべての RubyGems のバージョン情報を [Gem Version Methods - RubyGems.org API](http://guides.rubygems.org/rubygems-org-api/#gemversion) の API から取得

### クロールしたデータを解析用データとして整形

0. `$ bundle exec ruby lib/models/setup.rb`

    解析用の ActiveRecord データのセットアップ

1. `$ bundle exec ruby scripts/importer/importer.rb`

    クロールしたデータを ActiveRecord のデータに整形

2. `$ bundle exec ruby scripts/importer/uri_importer.rb`

    クロールしたデータのうち、URI に関するものを ActiveRecord のデータに整形

3. `$ bundle exec ruby scripts/importer/version_importer.rb`

    クロールしたデータのうち、バージョン情報に関するものを ActiveRecord のデータに整形

## 使用ツール

- [gnuplot](http://www.gnuplot.info/ "gnuplot homepage") - プロットデータの可視化
- [Gephi](http://gephi.org/ "Gephi, an open source graph visualization and manipulation software") - グラフ構造の解析、可視化

## 中の人

なにか分からないこと・気になることなどあれば、[@kei_s](https://twitter.com/kei_s "kei-s (kei_s) on Twitter") or/and [@june29](https://twitter.com/june29 "Jun OHWADA (本人確認済) (june29) on Twitter") までお気軽にどうぞ。
