# 解析用スクリプト

## ダウンロード数ランキング downloads\_rank.rb

    $ ruby scripts/downloads_rank.rb (30位まで表示)
    $ ruby scripts/downloads_rank.rb --data > data/download_rank.dat (Gnutplot用出力)


## 量産者ランキング author\_rank.rb

    $ ruby scripts/author_rank.rb (30位まで表示)
    $ ruby scripts/author_rank.rb --data > data/author_rank.dat (Gnutplot用出力)

## 人気の gem 作者ランキング author\_download\_rank.rb

    $ ruby scripts/author_download_rank.rb (30位まで表示)
    $ ruby scripts/author_download_rank.rb --data > data/auhtor_download_rank.dat (Gnutplot用出力)

## 依存されているライブラリ数が多い gem ランキング depended\_rank.rb

    $ ruby scripts/depended_rank.rb (50位まで表示)

## 依存関係グラフXML生成 generate\_dependency\_network\_gexf.rb

    $ ruby scripts/generate_dependency_network_gexf.rb > data/gems.gexf (Gephi用出力)

## gem の増え方 development\_transition.rb

    $ ruby scripts/development_transition.rb > data/development_transition_detail.dat (Gnuplot用出力)

## gem ホスト先の変化 hosting\_transition.rb

    $ ruby scripts/hosting_transition.rb > data/hosting_transition.dat (Gnuplot用出力)

# 結果を連載記事に載せていない解析用スクリプト

## 依存しているライブラリ数が多い gem ランキング depending\_rank.rb

    $ ruby scripts/depending_rank.rb (50位まで表示)

## リリース回数が多い gem ランキング release\_count\_rank.rb

    $ ruby scripts/release_count_rank.rb (30位まで表示)
    $ ruby scripts/release_count_rank.rb --data > data/release_count_rank.dat (Gnuplot用出力)

## gem の公開から最新のリリースまでの期間が長い gem ランキング long\_released\_rank.rb

    $ ruby scripts/long_released_rank.rb (30位まで表示)
