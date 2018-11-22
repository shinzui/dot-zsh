# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i> '
# exec 3>&2 2>/tmp/startlog.$$
# setopt xtrace prompt_subst

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'
  zgen prezto '*:*' color 'yes'

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
  zgen prezto completion
  zgen prezto fasd
  zgen load Tarrasch/zsh-autoenv
  # zgen load superbrothers/zsh-kubectl-prompt

  zgen save
fi

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,_build,_opam}/*"'
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin/:$HOME/bin:$HOME/.ellipsis/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:$HOME/Library/Python/2.7/bin/:$PATH
export EDITOR=nvim
export BAT_THEME=Nord

if [ -r ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -r ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if type rbenv > /dev/null 2>&1; then
#   eval "$(rbenv init -)"
# fi

if [ -r '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi

if [ -r '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

if type kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh) 
fi

if type helm > /dev/null 2>&1; then
  source <(helm completion zsh)
fi

if type rustc > /dev/null 2>&1; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src" 
fi

# if type rustup > /dev/null 2>&1; then
#   source <(rustup completions zsh)
# fi

# OPAM configuration
. /Users/shinzui/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# opam switch 4.02.3
eval $(opam config env)

# unsetopt xtrace
# exec 2>&3 3>&-
