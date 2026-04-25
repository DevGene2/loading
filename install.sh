#!/usr/bin/env bash
if [[ ${EUID} != 0 ]]; then
  echo "$0: sudo privileges are required to run this script!"
  exit 1
fi

filename="${BASH_SOURCE[0]}"
DIR=$(dirname "${filename}")
if [[ -f "${DIR}/loading.sh" ]]; then
  chmod u+x "${DIR}/loading.sh"
  sudo cp "${DIR}/loading.sh" /usr/local/bin/loading
  echo "Installation completed"
  echo "Run tool using: loading"
else
  echo "$0: loading.sh script is missing!"
  exit 1
fi
