#!/bin/bash
set -xe

CHART_NAME=$1

ct list-changed  --config .ct/ct.yaml
ct lint-and-install --config .ct/ct.yaml 


helm package helm/${CHART_NAME} -d ./charts/

