#!/usr/bin/env bash

set -e

cd $1
echo 'Initializing the project...'
npm init -y

echo 'Updating package.json...'
sed -i ' 
  s/"main": "index\.js"/"main": "\.\/dist\/main\.js"/
  s/"main": ".*",/&\n  "type": "module",/
  /"test": ".*"/d
  s/"scripts": {/&\n    "start": "npm run build \&\& node \.\/dist\/main\.js"/
  s/"scripts": {/&\n    "build": "npx tsc",/' package.json

echo 'Creating files...'
mkdir ./src
echo 'console.log("Hello World!");' >> ./src/main.ts

echo 'trailingComma: 'es5'
tabWidth: 4
semi: true
singleQuote: false' >> .prettierrc.yml

echo 'Generating tsconfig.json...'
npm i typescript
npx tsc --init

sed -i -r '/^[ \t]*\//d; /^[[:space:]]*$/d; s/\/\*(.*?)\*\///g; s/[[:blank:]]+$//' tsconfig.json
sed -i '
  s/"target": "es2016"/"target": "es2022"/
  s/"module": "commonjs"/"module": "es2022"/
  s/"compilerOptions": {/&\n    "rootDir": "\.\/src",/
  s/"compilerOptions": {/&\n    "outDir": "\.\/dist",/
  s/"compilerOptions": {/&\n    "moduleResolution": "node",/' tsconfig.json

echo 'dist/
node_modules/' >> .gitignore

echo 'Creating git repository...'
git init
git add .
git commit -m 'Init'

echo 'Done.'
