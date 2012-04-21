# 解析結果の出力

scripts/ の解析用コードの実行結果から、グラフやネットワークを出力する。

- 折れ線グラフは [Gnuplot](http://www.gnuplot.info/) を使って描画し、eps ファイルを作成する
- ネットワーク可視化は [Gephi](http://gephi.org/) を使って描画・調整を行い、スクリーンキャプチャなどで作成する

## ダウンロード数ランキング download\_rank.eps

    $ ruby data/generate_download_rank_graph.rb (data/download_rank.eps を作成)

## 量産者ランキング author\_rank.eps

    $ ruby data/generate_author_rank_graph.rb (data/author_rank.eps を作成)

## gem の増え方 development\_transition\_detail.eps

    $ ruby data/generate_development_transition_graph.rb
      (data/development_transition_detail.eps を作成)

## gem ホスト先の変化 hosting\_transition.eps

    $ ruby data/generate_hosting_transition_graph.rb
      (data/hosting_transition.eps を作成)

## 依存関係ネットワーク

`data/gems.gexf` を [Gephi](http://gephi.org/) で読み込み。

# 連載記事に載せていない解析結果

## ダウンロード数ランキングの両対数グラフ download\_rank\_logscale.eps

    $ ruby data/generate_download_rank_graph.rb logscale
      (両対数グラフ data/download_rank_logscale.eps を作成)

## 量産者ランキングの両対数グラフauthor\_rank\_logscale.eps

    $ ruby data/generate_author_rank_graph.rb logscale
      (両対数グラフ data/author_rank_logscale.eps を作成)

## 人気の gem 作者ランキング download\_rank.plot

     $ gnuplot -p data/download_rank.plot (Gnuplot で表示)

## リリース回数が多い gem ランキング release\_count\_rank.plot

     $ gnuplot -p data/release_count_rank.plot (Gnuplot で表示)
