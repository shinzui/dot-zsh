#!/bin/zsh
#
# shinzui/zsh ellipsis package

# The following hooks can be defined to customize behavior of your package:
pkg.install() {
  git.clone git@github.com:tarjoilija/zgen.git
#     fs.link_files $PKG_PATH
}

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
