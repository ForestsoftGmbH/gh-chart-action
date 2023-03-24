#!/bin/bash
set -xe

rm /root.ssh/known_hosts || true
ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts 
chmod 600 /root/.ssh/known_hosts

releaseDir=$(mktemp -d)
git clone git@github.com:ForestsoftGmbH/helm-charts.git $releaseDir
rsync -a --checksum  charts/ $releaseDir/charts
cd $releaseDir/charts
helm repo index . --url https://forestsoftgmbh.github.io/helm-charts/charts
git config --global user.email "actions@forestsoft.dev"
git config --global user.name "Github actions pipeline"
git add . && git commit -m "${CI_COMMIT_MESSAGE:-"Initial commit"}" && git push -f
