#!/bin/bash

set -euxo pipefail
#hugo server --buildDrafts --buildFuture --watch
hugo server --bind 0.0.0.0 --port 8080 --baseURL http://$(ifconfig en0 | grep "inet " | awk '{ print $2 }'):8080 --buildDrafts --buildFuture --watch
