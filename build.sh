#!/bin/bash
set -xe

CHART_NAME=$1

ct list-changed  --config .ct/ct.yaml
ct lint-and-install --config .ct/ct.yaml 

mkdir -p ./charts/
helm package ${CHART_NAME} -d ./charts/

