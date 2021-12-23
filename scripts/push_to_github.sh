#!/bin/bash

git remote add external https://${GITHUB_ACCESS_TOKEN}@github.com/slzone/ra-vsi-base-pattern
git push external public-github:master --force
