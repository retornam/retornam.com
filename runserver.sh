#!/bin/bash

set -euxo pipefail
hugo server --buildDrafts --buildFuture --watch

