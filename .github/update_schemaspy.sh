#!/bin/sh

setup_git() {
  git config --global user.email "etrimaille@3liz.com"
  git config --global user.name "3Liz bot"
}

update_schemaspy() {
  make schemaspy
}

commit_files() {
  git checkout -b master
  git add docs/
  git commit --message "Update schemaspy to version : $TRAVIS_TAG"
}

upload_files() {
  git remote add origin-push https://"${GH_TOKEN}"@github.com/"${TRAVIS_REPO_SLUG}".git > /dev/null 2>&1
  git push --quiet --set-upstream origin-push master
}

setup_git
update_schemaspy
commit_files
upload_files
