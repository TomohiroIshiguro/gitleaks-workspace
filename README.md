# ローカルに gitleaks 実行環境を構築する

## Gitleaks とは

```
Gitleaks is a SAST tool for detecting and preventing hardcoded secrets like passwords, api keys, and tokens in git repos. Gitleaks is an easy-to-use, all-in-one solution for detecting secrets, past or present, in your code.
```
Ref: https://github.com/zricethezav/gitleaks

## リポジトリの構成

Makefile: リポジトリをクローン後のコマンド。  
scripts: Makefile から参照する shell スクリプト。

## 作業手順

1. 当リポジトリをクローンする
2. gitleaks を実行する (コンテナを起動して、対象リポジトリの全ブランチを過去分を含めて検査する)
   - $ make detect ... ./src の Git リポジトリをチェックする. あらかじめ .src/ に Git リポジトリをクローンしておく.
   - $ make detect-repo ... 任意の Git リポジトリの URL を指定して Git リポジトリをチェックする (一番お手軽)
   - $ make detect-dir ... 任意のフォルダを指定して Git リポジトリをチェックする

詳しくはMakefile を参考にしてください。

## gitleaks で機密情報を含むコミットを見つけたら

Github の下記ページを参考に、センシティブなデータを含むコミットをリポジトリから削除する。  
Ref: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository
