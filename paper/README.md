# paper

卒業論文を HTML で書くために作った、2つの道具。

## 概要

| 項目 | 内容 |
| --- | --- |
| 時期 | 2020年10月 |
| 言語 | シェルスクリプト、Makefile、HTML、CSS |

卒業論文を、Word や LaTeX ではなく、HTML のファイルで書いていた。そのときに、書き始める準備と、書いたあとの書式の統一を楽にするために作ったものである。

| ディレクトリ | 内容 |
| --- | --- |
| [`setupPaper/`](setupPaper/) | 論文のひな形に、テーマや氏名を書き込んで、書き始められる状態にする |
| [`PaperFormat/`](PaperFormat/) | 論文の HTML を、決まった書式に整える |

リポジトリ全体の説明は、[リポジトリのトップの README](../README.md) を参照。

## ディレクトリ構成

### `setupPaper/`

| ファイル | 内容 |
| --- | --- |
| `setupPaper.sh` | 対話形式のスクリプト。テーマ、学部、学科、氏名、学生証番号を聞いて、ひな形の中の目印を置き換える |
| `Makefile` | `make setup` で、`setupPaper.sh` を実行する |
| `paper_temp/` | 論文のひな形。表紙、要旨、目次、はじめに、本文（第1章〜第5章）、おわりに、参考文献、付録、索引の HTML と、スタイル（`assets/css/`） |

ひな形の HTML には、置き換えるための目印が書いてある。スクリプトは、目印を、入力された内容と、実行した日の日付に置き換える。

| 目印 | 置き換える内容 |
| --- | --- |
| `theme` | 論文のテーマ |
| `gakubu`、`gakka` | 学部、学科 |
| `lastName`、`firstName` | 苗字、名前 |
| `fullName` | ローマ字の氏名 |
| `studentNumber` | 学生証番号の下6桁 |
| `YYYY`、`mm月dd日` | 実行した日の年、月日 |

### `PaperFormat/`

| ファイル | 内容 |
| --- | --- |
| `Makefile` | 整形の道具（HTML Tidy）のインストールと、HTML の整形 |
| `tidy-config.txt` | 整形の設定。字下げは空白4つ、1行は72文字で折り返す、文字コードは UTF-8、など |

## 実行環境

| ソフトウェア | バージョン | 用途 | 補足 |
| --- | --- | --- | --- |
| macOS | 10.15 Catalina | OS | `setupPaper.sh` は、macOS の `sed` と `date` の動きを前提に書いている |
| GNU Make | 3.81 | コマンドの実行 | macOS に付属 |
| Homebrew | — | HTML Tidy のインストール | |
| HTML Tidy（tidy-html5） | 5.6.0 | HTML の整形 | `PaperFormat/Makefile` に、このバージョンの場所が書いてある |

## 実行方法

### `setupPaper/`

`setupPaper/` に移動して、次のコマンドを実行する。質問に順に答えると、最後に「実行してもいいですか？」と聞かれるので、`y` と答える。

```sh
make setup
```

`paper_temp/` の中の HTML が、入力した内容に書き換わる。書き換えたあとの `paper_temp/` を、論文のフォルダとして使う。元のひな形には戻せないので、やり直すときは、リポジトリから取り出し直す。

### `PaperFormat/`

`Makefile` と `tidy-config.txt` を、論文のフォルダ（`index.html` のある場所）にコピーして、そこで実行する。

```sh
make install   # HTML Tidy をインストールする（初回だけ）
make tidy      # フォルダの中の HTML を、すべて整形する
```

## 備考

- `setupPaper/paper_temp/` のスタイル（`assets/css/index.css`、`custom.css`）は、実際に書いた卒業論文のものと同じである。卒業論文は、このひな形から書き始めた。
- `setupPaper.sh` の入力の例（「例：青木」など）は、当時のままである。
- `setupPaper.sh` は、目印を単純な文字の置き換えで書き換える。入力した内容に `/` が含まれていると、置き換えに失敗する。
- `PaperFormat/Makefile` は、HTML Tidy の場所を `/usr/local/Cellar/tidy-html5/5.6.0/bin/tidy` と決め打ちで書いている。別のバージョンを入れた場合や、Apple シリコンの Mac（Homebrew の場所が `/opt/homebrew`）では、`TIDY_PATH` を書き換える必要がある。
