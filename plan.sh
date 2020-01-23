pkg_name=httpd
pkg_origin=sksingh002
pkg_version="2.2.3"  #httpd-2.2.3.tar.gz
pkg_maintainer="Saurabh Kr Singh <sksingh002@gmail.com>"
pkg_license=("Apache-2.0")
pkg_source="http://archive.apache.org/dist/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="1cf27b27a915ebe1f43939ea78d334a2546e0fdcf78aa0a1664ba174bcb300d2"

pkg_build_deps=(
  core/patch
  core/make
  core/gcc
)

pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
pkg_exports=(
  [port]=serverport
)
pkg_exposes=(port)

pkg_svc_run="httpd -DFOREGROUND -f ${pkg_svc_config_path}/httpd.conf"

pkg_svc_user="root"
pkg_svc_group="$pkg_svc_user"

do_build() {
    ./configure --prefix="$pkg_prefix" 
    make
}