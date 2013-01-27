#!/bin/bash
rm -rf output_prod

vendor/bin/sculpin generate --env=prod || ( echo "Could not generate the site" && exit )
vendor/bin/sculpin assets:install --env=prod output_prod || ( echo "Could not install assets for the site" && exit )

cd output_prod
git init
git add .
git add -u
git commit -m "New Build"
git remote add origin git@github.com:farrelley/kapusta-brothers.git
git fetch origin
git checkout gh-pages
git push origin gh-pages --force