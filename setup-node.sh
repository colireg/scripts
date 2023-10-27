#!/usr/bin/env bash

set -e

cd $1
echo "Initializing the project..."
npm init -y

echo "Updating package.json..."
sed -i 's/"test": ".*"/"start": "node \.\/src\/main\.js"/' package.json
sed -i 's/"main": "index\.js"/"main": "\.\/src\/main\.js"/' package.json
sed -i 's/"main": ".*",/&\n  "type": "module",/' package.json

echo "Creating files..."
mkdir ./src
echo "console.log(\"Hello World!\");" >> ./src/main.js
{
  echo "trailingComma: 'es5'"
  echo "tabWidth: 4"
  echo "semi: true"
  echo "singleQuote: false"
} >> .prettierrc.yml
echo "node_modules/" >> .gitignore

echo "Creating git repository..."
git init
git add .
git commit -m "Init"

echo "Done."
