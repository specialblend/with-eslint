#!/usr/bin/env sh

# backup files if they exist
backup_files() {
  npx @specialblend/bak package.json
  npx @specialblend/bak .eslintrc.json
}

# common.sh .eslintrc.json
setup_eslintrc() {
  echo 'common.sh .eslintrc.json'
  npx @specialblend/cator .eslintrc.json {} | npx jq ".extends = \"$1\"" >.eslintrc.json
}

# common.sh lint scripts
setup_lint_scripts() {
  echo 'add lint scripts'
  echo "extensions=$1"
  package_json=$(npx @specialblend/cator package.json {})
  with_lint_script=$(echo $package_json | npx jq ".scripts.lint = \"eslint --ext $1 .\"")
  with_lint_fix_script=$(echo $with_lint_script | npx jq ".scripts.\"lint:fix\" = \"eslint --fix --ext $1 .\"")
  echo $with_lint_fix_script | npx jq >package.json
}

# install devDependencies
install_deps() {
  echo 'install devDependencies'
  npm install -D eslint @specialblend/eslint-config
}

confirm() {
  read -p "Press enter to continue, or ^C to cancel"
}
