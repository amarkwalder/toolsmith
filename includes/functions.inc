#!/bin/bash

if [[ ! ${PROJECT_ROOT_DIR+x} ]]; then
  echo "Environment variable 'PROJECT_ROOT_DIR' is not set!"
  exit 1
fi

source ${PROJECT_ROOT_DIR}/conf/.env-config
source ${PROJECT_ROOT_DIR}/.env

function subst() {
  if [ $# == 2 ]; then
    echo "$2"
    envsubst <${BASEDIR}/$1 >${BASEDIR}/$2
  elif [ $# == 3 ]; then
    echo "$3"
    envsubst <${BASEDIR}/$1 $2 >${BASEDIR}/$3
  else
    echo "Wrong parameter amount!"
    exit 1
  fi
}
