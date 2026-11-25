# paper-format

卒業論文の HTML を、HTML Tidy で決まった書式に整えるための Makefile と設定。

## 概要

| 項目 | 内容 |
| --- | --- |
| 時期 | 2020年10月 |
| 言語 | Makefile |

卒業論文を HTML のファイルで書いていた。ページの数が多く（表紙、要旨、目次、各章、参考文献など）、手で書いていると、字下げの幅や、1行の長さがファイルごとにばらつく。これを、道具でそろえるために作った。

### HTML Tidy とは

HTML Tidy（`tidy`）は、HTML のファイルを読み込んで、書式を整えた HTML を出力する、コマンドラインの道具である。次のことを行う。

- 字下げをそろえる。
- 長い行を、決まった幅で折り返す。
- タグや属性の大文字と小文字をそろえる。
- 閉じ忘れたタグを補うなど、HTML の誤りを直す。

どう整えるかは、設定ファイルで指定する。このディレクトリの `tidy-config.txt` が、その設定ファイルである。

### このディレクトリのもの

`Makefile` は、HTML Tidy を、フォルダの中の HTML すべてに対して、同じ設定で実行する。1つずつコマンドを打たずに、`make tidy` の1回で、論文全体の書式がそろう。

リポジトリ全体の説明は、[リポジトリのトップの README](../README.md) を参照。

## ファイル

| ファイル | 内容 |
| --- | --- |
| `Makefile` | HTML Tidy のインストールと、HTML の整形を行うコマンドをまとめたもの |
| `tidy-config.txt` | HTML Tidy の設定ファイル |

### `tidy-config.txt` の設定

| 設定 | 値 | 意味 |
| --- | --- | --- |
| `indent` | `auto` | 字下げをする。字下げするかどうかは、要素の中身に応じて、HTML Tidy が決める |
| `indent-spaces` | `4` | 字下げの幅を、空白4つにする |
| `wrap` | `72` | 1行が72文字を超えると、折り返す |
| `break-before-br` | `no` | `<br>` の前では、改行しない |
| `uppercase-tags` | `no` | タグの名前を、小文字で出力する |
| `uppercase-attributes` | `no` | 属性の名前を、小文字で出力する |
| `char-encoding` | `utf8` | 読み込みと出力の文字コードを、UTF-8 にする |
| `numeric-entities` | `yes` | 名前で書かれた文字参照（`&nbsp;` など）を、番号の形（`&#160;`）で出力する |
| `quote-marks` | `yes` | 引用符（`"`）を、`&quot;` で出力する |
| `quote-nbsp` | `yes` | 改行しない空白を、文字参照で出力する |
| `quote-ampersand` | `no` | そのまま書かれた `&` を、`&amp;` に書き換えない |
| `markup` | `yes` | 整えた HTML を出力する |
| `input-xml`、`output-xml` | `no` | XML としてではなく、HTML として読み込み、出力する |
| `show-warnings` | `no` | 警告を表示しない |
| `quiet` | `yes` | 処理の結果のまとめなど、整えた HTML 以外の出力を止める |

### `Makefile` の変数

| 変数 | 値 | 意味 |
| --- | --- | --- |
| `BREW_PATH` | `which brew` の結果 | Homebrew の場所 |
| `TIDY_PACKAGE` | `tidy-html5` | Homebrew でインストールするパッケージの名前 |
| `TIDY_PATH` | `/usr/local/Cellar/tidy-html5/5.6.0/bin/tidy` | 実行する HTML Tidy の場所 |
| `TIDY_CONFIG_TXT` | `./tidy-config.txt` | 設定ファイルの場所 |
| `TIDY_OPTIONS` | `-config ./tidy-config.txt` | HTML Tidy に渡すオプション |

### `Makefile` のコマンド

| コマンド | 内容 |
| --- | --- |
| `make install` | Homebrew で、HTML Tidy（`tidy-html5`）をインストールする |
| `make uninstall` | HTML Tidy をアンインストールする |
| `make check` | Homebrew が使えるかを確かめる。使えなければ、`NotFound brew!` と表示する。`install` と `uninstall` の前に、自動で実行される |
| `make tidy` | HTML を整形する |

`make tidy` は、次の順に動く。

1. いまのフォルダと、その下のフォルダから、名前が `.html` で終わるファイルを、すべて探す。
2. 見つけたファイルを1つずつ、`format <ファイル名>` と表示してから、HTML Tidy に渡す。
3. 整えた結果を、いったん `output.txt` に書き出す。
4. `output.txt` を、元のファイルの名前に変えて、上書きする。

## 実行環境

| ソフトウェア | バージョン | 用途 | 補足 |
| --- | --- | --- | --- |
| macOS | 10.15 Catalina | OS | |
| GNU Make | 3.81 | コマンドの実行 | macOS に付属 |
| Homebrew | — | HTML Tidy のインストール | |
| HTML Tidy（tidy-html5） | 5.6.0 | HTML の整形 | `Makefile` の `TIDY_PATH` に、このバージョンの場所が書いてある |

macOS には、最初から `/usr/bin/tidy` が入っているが、2006年の古い版である。この `Makefile` は、それではなく、Homebrew で入れた新しい版（tidy-html5）を、場所を指定して使っている。

## 実行方法

`Makefile` と `tidy-config.txt` を、論文のフォルダ（`index.html` のある場所）にコピーして、そこで実行する。

1. HTML Tidy をインストールする（初回だけ）。

   ```sh
   make install
   ```

2. HTML を整形する。

   ```sh
   make tidy
   ```

   整形したファイルの名前が、1つずつ表示される。

   ```text
   format ./index.html
   format ./Summary/index.html
   format ./Chapters/Chapter1/index.html
   ```

## 備考

- **元のファイルは、上書きされる。** 整形の前の状態は残らないので、Git などで、戻せるようにしてから実行する。
- **HTML Tidy の場所は、決め打ちで書いている。** `TIDY_PATH` は、Intel の Mac に、Homebrew でバージョン 5.6.0 を入れたときの場所である。別のバージョンを入れた場合や、Apple シリコンの Mac（Homebrew の場所が `/opt/homebrew`）では、`TIDY_PATH` を書き換える必要がある。場所は、`brew --prefix tidy-html5` で調べられる。
- **HTML Tidy は、書式だけでなく、HTML の誤りも直す。** 閉じ忘れたタグを補ったり、タグを小文字に直したりするので、整形の前後で、ファイルの中身が変わることがある。
- **警告は表示されない。** 設定で、警告の表示を止めている（`show-warnings: no`）。HTML に誤りがあっても、何も表示されずに、直されるか、そのまま出力される。
- 論文のひな形を用意する道具は、[`setup-paper/`](../setup-paper/) にある。
