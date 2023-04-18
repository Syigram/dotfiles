# fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
fpath+=('/home/sygram/.zsh/pure')

. $HOME/.asdf/asdf.sh

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


[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/repos/.asdf/asdf.sh ] && source ~/repos/.asdf/asdf.sh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
