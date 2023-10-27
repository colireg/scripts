#!/usr/bin/env bash

proxy_url=${1:-"socks5://localhost:9063/"}

export http_proxy="$proxy_url"
export HTTP_PROXY="$proxy_url"
export https_proxy="$proxy_url"
export HTTPS_PROXY="$proxy_url"

echo "set proxy to ${proxy_url}"
