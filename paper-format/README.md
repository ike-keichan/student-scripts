# paper-format

卒業論文の HTML を、決まった書式に整えるための Makefile と設定。

## 概要

| 項目 | 内容 |
| --- | --- |
| 時期 | 2020年10月 |
| 言語 | Makefile |

HTML で書いていた卒業論文の、字下げや折り返しをそろえるために作った。整形の道具（HTML Tidy）を、フォルダの中のすべての HTML に対して、同じ設定で実行する。

リポジトリ全体の説明は、[リポジトリのトップの README](../README.md) を参照。

## ファイル

| ファイル | 内容 |
| --- | --- |
| `Makefile` | HTML Tidy のインストールと、HTML の整形 |
| `tidy-config.txt` | 整形の設定。字下げは空白4つ、1行は72文字で折り返す、文字コードは UTF-8、など |

## 実行環境

| ソフトウェア | バージョン | 用途 |
| --- | --- | --- |
| macOS | 10.15 Catalina | OS |
| GNU Make | 3.81 | コマンドの実行。macOS に付属 |
| Homebrew | — | HTML Tidy のインストール |
| HTML Tidy（tidy-html5） | 5.6.0 | HTML の整形。`Makefile` に、このバージョンの場所が書いてある |

## 実行方法

`Makefile` と `tidy-config.txt` を、論文のフォルダ（`index.html` のある場所）にコピーして、そこで実行する。

```sh
make install   # HTML Tidy をインストールする（初回だけ）
make tidy      # フォルダの中の HTML を、すべて整形する
```

| コマンド | 内容 |
| --- | --- |
| `make install` | Homebrew で、HTML Tidy をインストールする |
| `make uninstall` | HTML Tidy をアンインストールする |
| `make tidy` | 下の階層も含めて、すべての `.html` を整形して、上書きする |

## 備考

- `Makefile` は、HTML Tidy の場所を `/usr/local/Cellar/tidy-html5/5.6.0/bin/tidy` と決め打ちで書いている。別のバージョンを入れた場合や、Apple シリコンの Mac（Homebrew の場所が `/opt/homebrew`）では、`TIDY_PATH` を書き換える必要がある。
- 論文のひな形を用意する道具は、[`setup-paper/`](../setup-paper/) にある。
