# student-scripts

学生時代に、自分の作業を楽にするために書いたスクリプト。

> 当時の記録として残しているリポジトリです。プログラムは当時のままで、リファクタリングや修正は行っていません。

## 概要

京都産業大学に在学していた 2020年3月〜10月に書いた、AppleScript とシェルスクリプトをまとめている。もとは言語ごとに別々のリポジトリだったものを、履歴を残したまま1つにまとめた。

## ディレクトリ構成

各スクリプトの説明は、それぞれのディレクトリの README に書いている。

| ディレクトリ | 内容 | 時期 | 元のリポジトリ |
| --- | --- | --- | --- |
| [`applescript/`](applescript/) | 論文を読むときのメモのファイルを、ひな形つきで作るスクリプト | 2020年4月 | MyAppleScriptProgram |
| [`shell/`](shell/) | 授業で使うソフトウェアのバージョンを一覧にして、教員の環境と比べるスクリプト | 2020年3月〜10月 | MyShellScriptProgram |

## 実行環境

macOS で実行する。シェルスクリプトは、macOS 10.15.7 での実行を想定して書いている。

## 実行方法

```sh
osascript applescript/MakePaperMemoMd.scpt
bash shell/aok_software_cheker.sh
```

## 備考

- `applescript/` の `.scpt.txt` は、同じ名前の `.scpt` と中身が同じファイルである。
- `shell/aok_software_cheker2.sh` は、比べる相手のバージョンを大学の Web ページから取得する。そのページが見られないときは動かない。
