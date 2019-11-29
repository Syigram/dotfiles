# fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
fpath+=("$HOME/.zsh/pure")
# fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')

autoload -U promptinit; promptinit

autoload -U compinit
compinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

prompt pure

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# zplug load --verbose
zplug load


[ -f ~/.zsh/completion.zsh ] && source ~/.zsh/completion.zsh
[ -f ~/.bash/sensitive ] && source ~/.bash/sensitive
[ -f ~/.zsh/history.zsh ] && source ~/.zsh/history.zsh
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh
[ -f ~/.zsh/keybindings.zsh ] && source ~/.zsh/keybindings.zsh


PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
  export PYENV_ROOT
  path_radd "$PYENV_ROOT/bin"
  eval "$(pyenv init -)"
fi

NODENV_ROOT="$HOME/.nodenv"
if [ -d "$NODENV_ROOT" ]; then
  export NODENV_ROOT
  path_radd "$NODENV_ROOT/bin"
  eval "$(nodenv init -)"
fi

HOME_BIN="$HOME/bin"
if [ -d "$HOME_BIN" ]; then
  path_ladd "$HOME_BIN"
fi

STACK_LOC="$HOME/.local/bin"
if [ -d "$STACK_LOC" ]; then
  path_ladd "$STACK_LOC"
fi

YARN_LOC="$HOME/.yarn/bin"
if [ -d "$YARN_LOC" ]; then
  path_ladd "$YARN_LOC"
fi

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# . $HOME/repos/.asdf/asdf.sh

# . $HOME/repos/.asdf/completions/asdf.bash


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


