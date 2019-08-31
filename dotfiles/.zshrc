fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')

autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

prompt pure

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose


## Automatically start tmux on every bash session
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
## ---




# Aliases --- {{{

alias oxy='cd ~/tfg/oxylus_github/'
alias inf='cd ~/tfg/informe/'

# Make "vim" direct to nvim
alias vim=nvim

# ls aliases
alias ll='ls -alF'
alias l='ls -CF'

#-------agonzalez's aliases -------
alias t=tmux
alias e=exit
alias q=exit
alias v=nvim
alias o=xdg-open

alias g='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

# }}}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
