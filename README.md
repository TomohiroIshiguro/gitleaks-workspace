# Gitleaks を使ってリポジトリに秘密鍵などが含まれていないことを確認する。

Gitleaks を使って、任意の Git リポジトリ内に秘密鍵などのセンシティブなデータが保存されていないことを確認します。

確認処理はコンテナ内で実施します。そのコンテナのネットワークは none モードで構築します。
そのため、確認処理中にコンテナの内外でアクセスが行われることはありません。

## Gitleaks とは: 参考資料

https://github.com/zricethezav/gitleaks

## 作業の準備

- Docker Desktop をインストールしておいてください。

## 作業手順

Makefile を参考にしてください。 