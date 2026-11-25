# student-scripts

学生時代に、自分の作業を楽にするために書いたスクリプト。

> 当時の記録として残しているリポジトリです。プログラムは当時のままで、リファクタリングや修正は行っていません。

## 概要

京都産業大学に在学していた 2019年1月〜2020年10月に書いた、AppleScript、シェルスクリプト、Makefile をまとめている。

## ディレクトリ構成

プログラムごとにディレクトリを分けている。それぞれの説明、実行環境、実行方法は、各ディレクトリの README に書いている。

| ディレクトリ | 内容 | 言語 | 時期 |
| --- | --- | --- | --- |
| [`make-memo/`](make-memo/) | デスクトップに、今日の日付の名前のメモのファイルを作る | シェルスクリプト | 2019年1月〜8月 |
| [`software-version-checker/`](software-version-checker/) | 授業で使うソフトウェアのバージョンを一覧にして、教員の環境と比べる | シェルスクリプト | 2020年3月〜10月 |
| [`make-paper-memo/`](make-paper-memo/) | 論文を読むときのメモのファイルを、ひな形つきで作る | AppleScript | 2020年4月 |
| [`setup-paper/`](setup-paper/) | 卒業論文のひな形に、テーマや氏名を書き込む | シェルスクリプト | 2020年10月 |
| [`paper-format/`](paper-format/) | 卒業論文の HTML を、決まった書式に整える | Makefile | 2020年10月 |

## 実行環境

どのプログラムも、macOS で実行する。当時の環境は、macOS 10.14 Mojave と、10.15 Catalina である。

## アプリケーション

`make-memo/` と `make-paper-memo/` のスクリプトは、当時、アプリケーションの形にして使っていた。そのときのアプリケーションを、[Releases](https://github.com/ike-keichan/student-scripts/releases) に置いている。Intel の Mac 用で、Apple の開発者の署名は付いていない。開くときに警告が出た場合は、アプリケーションを右クリックして、「開く」を選ぶ。
