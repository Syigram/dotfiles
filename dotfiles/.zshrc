fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')

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


## Automatically start tmux on every bash session
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
## ---


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


