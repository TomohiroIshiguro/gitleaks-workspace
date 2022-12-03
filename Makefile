CURDIR = "$(shell pwd)"

help:
	cat README.md
	cat Makefile

detect:
	# ./src フォルダ内の Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect
	docker run --rm --name gitleak \
	  -v ${CURDIR}/src:/src:ro \
	  -w /src \
	  --net=none \
	  zricethezav/gitleaks \
	  detect -v

detect-repo:
	# ./src フォルダ内の Git リポジトリに秘密鍵などが含まれていないかチェックする (branch の指定は任意)
	# usage: $ make detect-repo URL=(リポジトリのURL) [BRANCH=(ブランチ)]
	if [ -z ${BRANCH} ]; \
	then \
	  git clone ${URL} src; \
	else \
	  git clone -b ${BRANCH} ${URL} src; \
	fi
	make detect
	rm -Rf src

detect-dir:
	# 指定したフォルダ内の Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect-dir DIR=(リポジトリのディレクトリ)
	docker run --rm --name gitleak \
	  -v "${DIR}":/src:ro \
	  -w /src \
	  --net=none \
	  zricethezav/gitleaks \
	  detect -v
