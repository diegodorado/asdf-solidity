#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="solidity"
TOOL_TEST="solc --version"

case $(uname -s) in
  'Linux')
    OS="linux-amd64"
    ;;
  'Darwin')
    OS="macosx-amd64"
    ;;
esac

LIST_URL="https://raw.githubusercontent.com/ethereum/solc-bin/gh-pages/$OS/list.txt"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl -s "$LIST_URL" | sed -e 's/.*v//' -e 's/+.*//' 
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"
  file=$(curl -s "$LIST_URL" | grep "solc-$OS-v$version" | sed 's/+/%2B/')
  url="https://github.com/ethereum/solc-bin/raw/gh-pages/$OS/$file"

  echo "* Downloading $TOOL_NAME release $version from $url ..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  echo "PATH: $install_path"
  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path/bin"
    local tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    local bin_file="$install_path/bin/$tool_cmd"

    download_release "$version" "$bin_file"
    chmod +x "$install_path/bin/$tool_cmd" || fail "Could not chmod +x $install_path/bin/$tool_cmd."

    ls -la "$install_path/bin"

    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
