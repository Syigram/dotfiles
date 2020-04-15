# fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
fpath+=('/$HOME/.zsh/pure')

autoload -U promptinit; promptinit

autoload -U compinit
compinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# prompt pure

# source ~/.zsh/zplug/init.zsh
source /usr/local/opt/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

#Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# zplug load --verbose
zplug load


[ -f ~/.zsh/completion.zsh ] && source ~/.zsh/completion.zsh
[ -f ~/.bash/sensitive ] && source ~/.bash/sensitive
[ -f ~/.zsh/history.zsh ] && source ~/.zsh/history.zsh
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh
[ -f ~/.zsh/keybindings.zsh ] && source ~/.zsh/keybindings.zsh

[ -f $HOME/repos/.asdf/asdf.sh ] && source $HOME/repos/.asdf/asdf.sh
[ -f $HOME/repos/.asdf/completions/asdf.bash ] && source $HOME/repos/.asdf/completions/asdf.bash

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

# . $HOME/.asdf/asdf.sh

# . $HOME/.asdf/completions/asdf.bash

# JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home/"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
path_radd "$JAVA_HOME/bin"
path_radd "/Users/alegonza10/Downloads/apache-maven-3.6.3/bin"

export api_trace_tool_username="trace.tool.api@sapient.nissanpace.com"
export api_trace_tool_password="SKc-86b-pw3-rM3!"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



. /usr/local/opt/asdf/asdf.sh
