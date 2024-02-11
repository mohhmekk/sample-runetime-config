#!/bin/sh
OUT_ENV_CONFIG_FILE=./env-config.js
if [[ -z "${DEPLOYMENT_ENV}" ]]; then
  ENV=dev
else
  ENV="${DEPLOYMENT_ENV}"
fi
IN_ENV_FILE=./config/"$ENV".env

echo "window._env_ = {" > $OUT_ENV_CONFIG_FILE
awk -F '=' '{ print $1 ": \"" (ENVIRON[$1] ? ENVIRON[$1] : $2) "\"," }' $IN_ENV_FILE >> $OUT_ENV_CONFIG_FILE
echo "}" >> $OUT_ENV_CONFIG_FILE