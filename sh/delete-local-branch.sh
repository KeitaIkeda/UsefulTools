#!/bin/sh

echo "マージ済みローカルブランチをすべて削除します"

for i in `find . -maxdepth 1 -mindepth 1 -type d`
do
echo "**********************************"
echo "処理開始 : $i"
cd $i
git fetch --prune
git checkout master
git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d
echo "処理終了 : $i"
echo "**********************************\n"
done

echo "全リポジトリのマージ済ローカルブランチの削除が完了しました"

