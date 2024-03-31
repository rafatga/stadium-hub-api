#!/bin/bash

SHARED_NETWORK="stadium-network-proxy"
docker network inspect ${SHARED_NETWORK} >/dev/null 2>&1 || \
    docker network create ${SHARED_NETWORK} --driver bridge