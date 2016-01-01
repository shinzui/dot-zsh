source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zegen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'

  zgen prezto
  zgen prezto git
  zgen prezto syntax-highlighting
  zgen prezto homebrew
  zgen prezto osx
  zgen prezto history
  zgen prezto directory

  zgen save
fi
