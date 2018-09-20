#!/bin/bash

set -e

git config user.name "Travis CI"
git config user.email "travis@travis-ci.org"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/rafaelbattesti/TerraformTutorials.git
git diff --quiet && git diff --staged --quiet || git commit -am "[skip ci] Autocommit - IaC state changed."
git push --quiet origin HEAD:${TRAVIS_BRANCH}