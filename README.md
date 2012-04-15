# WEB+DB PRESS Vol.68「Rubyわくわくナビ 最終回」利用コード

Ruby わくわくナビ最終回「データで見るRubyGemsの世界」で利用したコードです

## lib/
クローラと、収集したデータの格納のための Sequel モデル定義

### lib/models/
データ処理のための ActiveRecord モデル定義と、マイグレーションファイル

## scripts/
各種データ解析を行うスクリプト

### scripts/importer/
Sequel データから ActiveRecord データへの移行を行うスクリプト

## Rakefile
データクローリングのための Rake タスク

## data/
各種解析データと、可視化のためのスクリプト

## db/
収集データ用 sqlite3 ファイル
