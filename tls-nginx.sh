#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

DIR=/etc/nginx/certs
readonly DIR

mkdir -p "${DIR}"

PASSPHRASE=$(uuid)
readonly PASSPHRASE

openssl genrsa \
  -des3 \
  -passout pass:"${PASSPHRASE}" \
  -out "${DIR}"/protected-key.pem \
  2048
openssl rsa \
  -passin pass:"${PASSPHRASE}" \
  -in "${DIR}"/protected-key.pem \
  -out "${DIR}"/server.key
openssl req \
  -new \
  -key "${DIR}"/server.key \
  -out "${DIR}"/cert.csr \
  -subj "/C=US/ST=IA/L=Des\ Moines/O=PlanetHolt/OU=bpholt/CN=localhost"
openssl x509 \
  -req \
  -days 3650 \
  -in "${DIR}"/cert.csr \
  -signkey "${DIR}"/server.key \
  -out "${DIR}"/server.crt
