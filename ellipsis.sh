#!/usr/bin/env bash
#
# shinzui/zsh ellipsis package

# The following hooks can be defined to customize behavior of your package:
pkg.install() {
  git.clone git@github.com:tarjoilija/zgen.git

  change_shell
}

change_shell() {
  if [ "$(command -v zsh)" != "$SHELL" ]; then
    echo "Changing shell to zsh"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
  fi
}
# pkg.push() {
#     git.push
# }

pkg.pull() {
   git.pull

   # update zgen
   zgen selfupdate

   #update all zgen plugins and reset
   zgen update
}

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
