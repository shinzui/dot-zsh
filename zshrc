source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'

  zgen prezto
  zgen prezto git
  zgen prezto syntax-highlighting
  zgen prezto homebrew
  zgen prezto osx
  zgen prezto history
  zgen prezto directory
  zgen prezto environment
  zgen prezto ruby
  zgen prezto prompt
  zgen prezto node
  zgen prezto utility
  zgen prezto history-substring-search
  zgen prezto fasd

  zgen save
fi
