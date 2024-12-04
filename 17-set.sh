#!/bin/bash

set -e #Setting the automatic exit, if we get error set -ex for debug.

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR #ERR is the error signal

echo "Hello world success"
echooooo "Hello world failure"
echo "Hello world after failure"