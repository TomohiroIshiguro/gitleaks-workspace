CURDIR = "$(shell pwd)"

help:
	cat README.md
	cat Makefile

detect:
	# ./src フォルダの Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect
	sh scripts/detect.sh ${CURDIR}

detect-repo:
	# 任意の Git リポジトリに秘密鍵などが含まれていないかチェックする (リポジトリ内の branch は全走査)
	# usage: $ make detect-repo URL=(リポジトリのURL)
	sh scripts/detect-repo.sh ${CURDIR} ${URL}

detect-dir:
	# 任意のフォルダの Git リポジトリに秘密鍵などが含まれていないかチェックする
	# usage: $ make detect-dir DIR=(リポジトリのディレクトリ)
	sh scripts/detect-dir.sh "${DIR}"
