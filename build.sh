#!/bin/bash

BUILD_OPTIONS=''
PUSH_TAG='no'

while getopts "np" option; do
    case $option in
        n)
            BUILD_OPTIONS='--no-cache'
        ;;
        p)
            PUSH_TAG='yes'
        ;;
    esac
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
docker build $DIR -t mmerian/transmission:latest $BUILD_OPTIONS

if [ "$PUSH_TAG" == "yes" ]; then
    echo "Pushing tag latest"
    docker push "mmerian/transmission:latest"
fi
