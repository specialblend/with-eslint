#!/usr/bin/env sh

echo 'quickly common.sh eslint'

echo ''
echo 'i am about to:'
echo '  - npm install eslint @specialblend/eslint-config'
echo '  - set .eslintrc.json to extend @specialblend/eslint-config'
echo '  - add lint and lint:fix scripts to package.json'
echo ''
echo '(i will make a backup of files before changing them)'
echo ''
echo 'ok?'
echo ''

confirm

backup_files && setup_eslintrc @specialblend/eslint-config && setup_lint_scripts .js,.jsx

install_deps

# all done !
echo 'all done!'
