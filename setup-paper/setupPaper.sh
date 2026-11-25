#!/bin/bash
# -*- coding: utf-8 -*-

PAPER_DIRECTORY="./paper_temp"
TODAYS_YEAR=$(date +%Y)
TODAYS_MONTH=$(date +%-m)
TODAYS_DAY=$(date +%-d)

replace(){
    sed -ie "s/theme/${theme}/g" $1; 
    sed -ie "s/gakubu/${gakubu}/g" $1; 
    sed -ie "s/gakka/${gakka}/g" $1;
    sed -ie "s/lastName/${last_name}/g" $1;
    sed -ie "s/firstName/${first_name}/g" $1;
    sed -ie "s/fullName/${full_name}/g" $1;
    sed -ie "s/studentNumber/${student_number}/g" $1;
    sed -ie "s/YYYY/${TODAYS_YEAR}/g" $1;
    sed -ie "s/mm月dd日/${TODAYS_MONTH}月${TODAYS_DAY}日/g" $1;
}

start(){
    for each in `find ${PAPER_DIRECTORY} -name *.html` ; do replace ${each} ; done;
    for each in `find ${PAPER_DIRECTORY} -name *.htmle` ; do rm -rf ${each} ; done;
    echo "論文のテンプレートを終えました。良い論文ライフを！";
}

echo "これより論文のテンプレートを作成します。";
read -p "論文テーマ名を記入してください。" theme;
read -p "あなたの学部名を記入してください（例：情報理工学部）" gakubu;
read -p "あなたの学科名を記入してください（例：情報理工学科）" gakka;
read -p "あなたの苗字を記入してください（例：青木）" last_name;
read -p "あなたの名前を記入してください（例：淳）" first_name;
read -p "あなたのフルネームをローマ字で記入してください（例：Atsushi Aoki）" full_name;
read -p "あなたの学生証番号の下6桁を記入してください（例：000000）" student_number;
read -p "実行してもいいですか？ (y/N): " yes_or_no; case "$yes_or_no" in [yY]*) start ;; *) echo "やめときますね。";; esac
