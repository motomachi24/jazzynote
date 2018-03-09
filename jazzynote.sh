#!/bin/bash

function usage {
cat <<_EOT_
$(basename ${0}) は jazzy doc 生成用スクリプトです。

Usage:
    $(basename ${0})

Options:
    -a AUTHOR         : set author name.
    -u AUTHOR_URL     : set author url.
    -v MODULE_VERSION : set module version.
    -l                : leave build folder.
    -m MODULE         : set module name.
    -h                : print this.
    (when -m is omitted, set execution folder name to module name.)

_EOT_
    exit 1
}

function version {
cat <<_EOT_
$(basename ${0}) version 0.0.0
_EOT_
    exit 1
}

usecurrent=true
author="(default user name)"
authorurl="(default url)"
moduleversion="0.00"
modulename=""
removeBuild=true

# option
while getopts a:hlm:u:v: OPT
do
  case $OPT in
      a ) author=$OPTARG ;;
      l ) removeBuild=false ;;
      u ) authorurl=$OPTARG ;;
      v ) moduleversion=$OPTARG ;;
      h ) usage ;;
      m ) modulename=$OPTARG usecurrent=false ;;
      \?) usage ;;
  esac
done

# オプション m がなければ実行フォルダ名が、あれば引数がモジュール名となる
if ${usecurrent}; then
	path=$(pwd)
	array=( `echo $path | tr -s '/' ' '`)
	last_index=`expr ${#array[@]} - 1`
	modulename=${array[${last_index}]}
fi

# jazzy 実行
jazzy --min-acl internal --clean --output document --author ${author} --author_url ${authorurl} --theme 'apple' --module-version 0.00 --module ${modulename}

if ${removeBuild}; then
  buildpath="./build"
  if [ -e ${buildpath} ]; then
    rm -rf ${buildpath}
  fi
fi
