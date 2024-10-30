#! /bin/bash

set -e
# -e setting the automatic exit if we get error, set -ex for debug

failur() {
echo "Failed at ($1:$2)"
}

trap 'failur "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal
echo "Hello world success"
echooo ""Hello world failure"
echo "Hello world after failure"