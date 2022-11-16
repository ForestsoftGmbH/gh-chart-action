#!/bin/bash
set -xe
releaseDir=$(mktemp -d)
mkdir -p ~/.ssh
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
chmod 600 ~/.ssh/known_hosts
ls -al ~/.ssh/
ssh -vvvT git@github.com
git clone git@github.com:ForestsoftGmbH/helm-charts.git $releaseDir
rsync -a --checksum  charts/ $releaseDir/charts
cd $releaseDir/charts
helm repo index . --url https://forestsoftgmbh.github.io/helm-charts/charts
git add . && git commit -m "${CI_COMMIT_MESSAGE:-"Initial commit"}" && git push -f
