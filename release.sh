#!/bin/bash
set -xe
export CI_COMMIT_MESSAGE="${{github.event.head_commit.message}}"
releaseDir=$(mktemp -d)
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git clone git@github.com:Forestsoft-de/helm-charts.git $releaseDir
rsync -a --checksum  charts/ $releaseDir/charts
cd $releaseDir/charts
helm repo index . --url https://forestsoftgmbh.github.io/helm-charts/charts
git add . && git commit -m "${CI_COMMIT_MESSAGE:-"Initial commit"}" && git push -f
