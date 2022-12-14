workspace(name = "rules_python_cross_repo")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

rules_python_version = "0.12.0"
http_archive(
    name = "rules_python",
    sha256 = "b593d13bb43c94ce94b483c2858e53a9b811f6f10e1e0eedc61073bd90e58d9c",
    strip_prefix = "rules_python-%s" % rules_python_version,
    url = "https://github.com/bazelbuild/rules_python/archive/%s.tar.gz" % rules_python_version,
)

load("@rules_python//python:pip.bzl", "pip_parse")
pip_parse(
    name = "pip_darwin",
    download_only = True,
    extra_pip_args = ["--platform", "macosx_12_5_x86_64", "-vvv"],
    requirements_lock = "//:requirements-lock.darwin_py3.txt",
)

pip_parse(
    name = "pip_linux",
    download_only = True,
    extra_pip_args = ["--platform", "manylinux1_x86_64", "--platform", "linux_x86_64", "--platform", "manylinux2010_x86_64", "--platform", "manylinux2014_x86_64"],
    requirements_lock = "//:requirements-lock.linux_py3.txt",
)


load("@pip_darwin//:requirements.bzl", darwin_install="install_deps")
load("@pip_linux//:requirements.bzl", linux_install="install_deps")

darwin_install()
linux_install()
