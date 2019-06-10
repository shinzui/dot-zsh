#!/usr/bin/env bash
#
# shinzui/zsh ellipsis package

# The following hooks can be defined to customize behavior of your package:
pkg.install() {
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

  change_shell
}

pkg.link() {
  keybase decrypt -i zsh_secrets.encrypted -o zsh_secrets
  fs.link_file zshrc
  fs.link_file zsh_functions
  fs.link_file zsh_aliases
  fs.link_file zsh_secrets
  fs.link_file zpreztorc
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

   /usr/local/bin/zsh <<'EOF'
   source "${HOME}/.zgen/zgen.zsh"
   # update zgen
   zgen selfupdate

   #update all zgen plugins and reset
   zgen update
EOF

}

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }
