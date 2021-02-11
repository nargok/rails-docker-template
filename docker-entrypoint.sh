#!/bin/bash

set -eu

# Yarnの依存関係をチェックする
yarn check --integrity --silent || true

# Bundlerの依存関係をチェックしておく
bundle check || true

# tmp/pids/serve.pidが残っていたら削除する
if [ "${1:-}" = rails -a "{2:-}" = server ]; then
  if [ -f tmp/pids/server.pid ]; then
    rm -v tmp/pids/server.pid
  fi
fi

exec "$@"
