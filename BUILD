load("@rules_python//python/pip_install:requirements.bzl", "compile_pip_requirements")
load(":blah.bzl", "load_pip_pkgs")

compile_pip_requirements(
    name = "requirements_darwin",
    requirements_in = "requirements.in",
    requirements_txt = "requirements-lock.darwin_py3.txt",
    extra_args = ["--allow-unsafe"],
    target_compatible_with = [
        "@platforms//os:osx",
        "@platforms//cpu:x86_64",
    ],
)

compile_pip_requirements(
    name = "requirements_linux",
    requirements_in = "requirements.in",
    requirements_txt = "requirements-lock.linux_py3.txt",
    extra_args = ["--allow-unsafe"],
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)

config_setting(
    name = "darwin_x86_64",
    constraint_values = [
        "@platforms//os:osx",
        "@platforms//cpu:x86_64",
    ],
)

config_setting(
    name = "linux_x86_64",
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)

load_pip_pkgs()

genquery(
    name = "hello_deps",
    expression = "deps(':hello')",
    scope = [":hello"],
)

py_binary(
    name = "hello",
    srcs = ["hello.py"],
    deps = [
        ":keyring",
    ],
)
