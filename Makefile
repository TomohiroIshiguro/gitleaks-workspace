CURDIR = "$(shell pwd)"

help:
	cat README.md
	cat Makefile

detect:
	# ./src フォルダの Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect
	docker run --rm --name gitleak \
	  -v ${CURDIR}/src:/src:ro \
	  -w /src \
	  --net=none \
	  zricethezav/gitleaks \
	  detect -v

detect-repo:
	# 任意の Git リポジトリに秘密鍵などが含まれていないかチェックする (リポジトリ内の branch は全走査)
	# usage: $ make detect-repo URL=(リポジトリのURL)
	git clone "${URL}" src
	make detect
	rm -Rf src

detect-dir:
	# 任意のフォルダの Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect-dir DIR=(リポジトリのディレクトリ)
	docker run --rm --name gitleak \
	  -v "${DIR}":/src:ro \
	  -w /src \
	  --net=none \
	  zricethezav/gitleaks \
	  detect -v
