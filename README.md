# Gitleaks を使って Git リポジトリに秘密鍵などが含まれていないことを確認する。

Gitleaks を使って、任意の Git リポジトリに秘密鍵などのセンシティブなデータが保存されていないことを確認します。

確認処理はコンテナで実施します。そのコンテナのネットワークは none モードで構築します。
そのため、確認処理中にコンテナの内外でアクセスが行われることはありません。

## Gitleaks とは: 参考資料

https://github.com/zricethezav/gitleaks

## 作業の準備

- Docker Desktop をインストールしておいてください。

## 作業手順

- $ make detect ... ./src の Git リポジトリをチェックする. あらかじめ .src/ に Git リポジトリをクローンしておく.
- $ make detect-repo ... 任意の Git リポジトリの URL を指定して Git リポジトリをチェックする (一番お手軽)
- $ make detect-dir ... 任意のフォルダを指定して Git リポジトリをチェックする

詳しくはMakefile を参考にしてください。
