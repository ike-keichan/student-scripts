# paper-format

卒業論文の HTML を、HTML Tidy で決まった書式に整えるための Makefile と設定。

## 概要

| 項目 | 内容 |
| --- | --- |
| 時期 | 2020年10月 |
| 言語 | Makefile |

卒業論文を HTML のファイルで書いていた。論文は14個の HTML に分かれていて、手で書いていると、字下げの幅や、1行の長さが、ファイルごとにばらつく。これを、道具でそろえるために作った。

HTML Tidy（`tidy`）は、HTML のファイルを読み込んで、書式を整えた HTML を出力する、コマンドラインの道具である。字下げをそろえる、長い行を決まった幅で折り返す、タグの大文字と小文字をそろえる、閉じ忘れたタグを補うなど誤りを直す、といったことを行う。どう整えるかは、設定ファイルで指定する。

このディレクトリの `Makefile` は、HTML Tidy を、フォルダの中の HTML すべてに対して、同じ設定で実行する。1つずつコマンドを打たずに、`make tidy` の1回で、論文全体の書式がそろう。

リポジトリ全体の説明は、[リポジトリのトップの README](../README.md) を参照。

## ディレクトリ構成

| ファイル | 内容 |
| --- | --- |
| `Makefile` | HTML Tidy のインストールと、HTML の整形を行うコマンドをまとめたもの |
| `tidy-config.txt` | HTML Tidy の設定ファイル |

`Makefile` のコマンドは、次のとおりである。

| コマンド | 内容 |
| --- | --- |
| `make install` | Homebrew で、HTML Tidy（`tidy-html5`）をインストールする |
| `make uninstall` | HTML Tidy をアンインストールする |
| `make check` | Homebrew が使えるかを確かめる。使えなければ、`NotFound brew!` と表示する。`install` と `uninstall` の前に、自動で実行される |
| `make tidy` | いまのフォルダと、その下のフォルダにある `.html` を、すべて整形して、上書きする |

`tidy-config.txt` の設定は、次のとおりである。

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

## 実行環境

当時使っていた環境のうち、実行に必要なソフトウェアを挙げる。当時は各ソフトウェアを常に最新版に更新していたので、バージョンは、リポジトリに記録が残っているものはその値を、残っていないものは当時の最新版を書いている。どちらでも分からないものは「不明」としている。

| ソフトウェア | バージョン | 用途 | 補足 |
| --- | --- | --- | --- |
| macOS | 10.15.7 Catalina | OS | |
| GNU Make | 3.81 | コマンドの実行 | macOS に付属するもの |
| Homebrew | 2.5.7 | HTML Tidy のインストール | リポジトリに記録はない。作成した時点の最新版 |
| HTML Tidy（tidy-html5） | 5.6.0 | HTML の整形 | `Makefile` に、このバージョンの場所が書いてある |

macOS には、最初から `/usr/bin/tidy` が入っているが、2006年の古い版である。この `Makefile` は、それではなく、Homebrew で入れた版（tidy-html5）を、場所を指定して使っている。

## セットアップ

次の手順で、実行に必要なソフトウェアを用意する。当時より新しいバージョンでの動作は確認していないので、動かない場合は「実行環境」の表に近いバージョンを使う。

1. [Homebrew](https://brew.sh/) をインストールする。`brew --version` でバージョンが表示されれば、使える。
2. `Makefile` と `tidy-config.txt` を、論文のフォルダ（`index.html` のある場所）にコピーする。
3. 論文のフォルダで、HTML Tidy をインストールする。

   ```sh
   make install
   ```

4. `Makefile` の `TIDY_PATH` を、インストールされた HTML Tidy の場所に合わせる。場所は、`brew --prefix tidy-html5` で調べられる。`Makefile` には、Intel の Mac に、バージョン 5.6.0 を入れたときの場所（`/usr/local/Cellar/tidy-html5/5.6.0/bin/tidy`）が書いてある。

## 実行方法

論文のフォルダで、次のコマンドを実行する。

```sh
make tidy
```

`.html` のファイルが1つずつ整形され、そのたびに、ファイルの名前が表示される。

```text
format ./index.html
format ./Summary/index.html
format ./Chapters/Chapter1/index.html
```

## 備考

- 元のファイルは、上書きされる。整形の前の状態は残らないので、Git などで、戻せるようにしてから実行する。
- `make tidy` は、整えた結果を、いったん `output.txt` に書き出してから、元のファイルの名前に変えている。
- HTML Tidy は、書式だけでなく、HTML の誤りも直す。閉じ忘れたタグを補ったり、タグを小文字に直したりするので、整形の前後で、ファイルの中身が変わることがある。
- 設定で、警告の表示を止めている（`show-warnings: no`）。HTML に誤りがあっても、何も表示されない。
- 論文のひな形を用意する道具は、[`setup-paper/`](../setup-paper/) にある。
