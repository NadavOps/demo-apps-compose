#!/bin/bash
set -e

parse_arguments() {
  parse_arguments_help() {
    echo """
Usage:
  Runs a sample oauth-proxy
  run.sh -i OAUTH_GOOGLE_CLIENT_ID -s OAUTH_GOOGLE_CLIENT_SECRET [-e](OAUTH2_PROXY_EMAIL_DOMAINS) [-h](help)
"""
  }
  local o i s e h
  while getopts "i:s:e:h" o; do
    case "$o" in
        h)
            parse_arguments_help; exit 0
            ;;
        p)
            OAUTH_GOOGLE_CLIENT_ID="${OPTARG}"
            ;;
        r)
            OAUTH_GOOGLE_CLIENT_SECRET="${OPTARG}"
            ;;
        e)
            OAUTH2_PROXY_EMAIL_DOMAINS="${OPTARG}"
            ;;
        *)
            parse_arguments_help; exit 1
            ;;
    esac
  done
  if [[ -z "$OAUTH_GOOGLE_CLIENT_ID" ]]; then echo "ERROR OAUTH_GOOGLE_CLIENT_ID cant be empty"; fi
  if [[ -z "$OAUTH_GOOGLE_CLIENT_SECRET" ]]; then echo "ERROR OAUTH_GOOGLE_CLIENT_SECRET cant be empty"; fi
}

export OAUTH_GOOGLE_CLIENT_ID="$OAUTH_GOOGLE_CLIENT_ID"
export OAUTH_GOOGLE_CLIENT_SECRET="$OAUTH_GOOGLE_CLIENT_SECRET"
export OAUTH_PROXY_EMAIL_DOMAINS="${OAUTH_PROXY_EMAIL_DOMAINS-*}"
export OAUTH_GOOGLE_COOKIE_SECRET=$(dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64 | tr -d -- '\n' | tr -- '+/' '-_'; echo)

docker-compose up -d
