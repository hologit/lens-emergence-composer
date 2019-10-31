pkg_name=lens-composer
pkg_origin=holo
pkg_version="0.1.0"
pkg_maintainer="Chris Alfano <chris@jarv.us>"
pkg_license=("MIT")
pkg_build_deps=(
)
pkg_deps=(
  core/composer
  core/git
  core/node
)
pkg_bin_dirs=(bin)


do_setup_environment() {
  set_buildtime_env COMPOSER_ALLOW_SUPERUSER "1"
}

do_build() {
  pushd "${CACHE_PATH}" > /dev/null

  build_line "Generating lens script"
  mkdir -v "bin"
  cp -v "${PLAN_CONTEXT}/lens-tree" ./bin/
  fix_interpreter "bin/*" core/node bin/node

  build_line "Running: npm install"
  cp -v "${PLAN_CONTEXT}"/package{,-lock}.json ./
  npm install

  # build_line "Running: composer require wikimedia/composer-merge-plugin"
  # composer require wikimedia/composer-merge-plugin \
  #   --no-interaction \
  #   --optimize-autoloader \
  #   --classmap-authoritative

  popd > /dev/null
}

do_install() {
  cp -r "${CACHE_PATH}"/* "${pkg_prefix}/"
}

do_strip() {
  return 0
}
