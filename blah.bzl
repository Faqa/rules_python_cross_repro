load("@pip_darwin//:requirements.bzl", darwin_packages = "all_requirements")
load("@pip_linux//:requirements.bzl", linux_packages = "all_requirements")

def load_pip_pkgs():
    DARWIN_PACKAGE_NAMES = [p[len("@pip_darwin_"):-len("//:pkg")] for p in darwin_packages]

    LINUX_PACKAGE_NAMES = [p[len("@pip_linux_"):-len("//:pkg")] for p in linux_packages]

    PACKAGE_NAMES = [p for p in DARWIN_PACKAGE_NAMES if p in LINUX_PACKAGE_NAMES]

    for p in PACKAGE_NAMES:
        native.alias(
            name = p,
            actual = select({
                ":darwin_x86_64": "@pip_darwin_%s//:pkg" % p,
                ":linux_x86_64": "@pip_linux_%s//:pkg" % p,
            }),

            visibility = ["//visibility:public"],
        )

