#!/bin/bash
set -xe
releaseDir=$(mktemp -d)
#mkdir -p ~/.ssh
#ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git clone git@github.com:Forestsoft-de/helm-charts.git $releaseDir
rsync -a --checksum  charts/ $releaseDir/charts
cd $releaseDir/charts
helm repo index . --url https://forestsoftgmbh.github.io/helm-charts/charts
git add . && git commit -m "${CI_COMMIT_MESSAGE:-"Initial commit"}" && git push -f
