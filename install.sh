#!/bin/bash

set -e

GITHUB_SRC='git@github.com:valo/phoenix_with_nextjs.git'
SKELETON_MODULE_NAME="PhoenixWithNextjs"
SKELETON_PROJECT_NAME="phoenix_with_nextjs"

NEW_PROJECT_NAME=$1
NEW_MODULE_NAME=`elixir -e "Macro.camelize(\"$NEW_PROJECT_NAME\") |> IO.puts"`

git clone $GITHUB_SRC

cd $SKELETON_PROJECT_NAME

grep -lr $SKELETON_MODULE_NAME . | LC_ALL=C xargs sed -i '' -e "s/$SKELETON_MODULE_NAME/$NEW_MODULE_NAME/g"
grep -lr $SKELETON_PROJECT_NAME . | LC_ALL=C xargs sed -i '' -e "s/$SKELETON_PROJECT_NAME/$NEW_PROJECT_NAME/g"
mv lib/$SKELETON_PROJECT_NAME lib/$NEW_PROJECT_NAME
mv lib/$SKELETON_PROJECT_NAME\_web lib/$NEW_PROJECT_NAME\_web
mv lib/$SKELETON_PROJECT_NAME.ex lib/$NEW_PROJECT_NAME.ex

rm -fr .git/
rm .gitignore

cd ..

mv $SKELETON_PROJECT_NAME $NEW_PROJECT_NAME
