
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='clear; ls -CF --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias oxy='cd ~/tfg/oxylus_github/'
alias oxl='v -S ~/.vim/sessions/main.vim'
alias inf='cd ~/tfg/informe/'
alias memg='cd ~/src/memory_game/front_end/src/'
alias openchess='cd ~/src/chess/src/; vim components/Board.js'

# Make "vim" direct to nvim
alias vim=nvim

# ls aliases
alias ll='ls -alF'
alias l='ls -CF'
alias cl='clear_and_list'
alias -g G='| grep'

#====== agonzalez's aliases =======
alias t=tmux
alias e=exit
alias m=make
alias q=exit
alias v=nvim
alias o=xdg-open

alias sshlol='ssh sygram@latinlol -p 17171'

alias envc='python -m venv .venv'
alias enva='. .venv/bin/activate'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias g='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gcb='git checkout -b'
alias go='git checkout'
alias gom='git checkout master'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gpu='git push -u'

#====== python =======

alias pr='python main.py'


# Set copy/paste helper functions
# the perl step removes the final newline from the output
alias pbcopy="perl -pe 'chomp if eof' | xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"




#====== directories =======

REPOS_DIR=/home/agonzalez/repositories
alias kips3="cd ${REPOS_DIR}/KIP-S3-To-S3-Transfer"
alias kipsftp="cd ${REPOS_DIR}/KIP-SFTP-To-S3-Transfer"
alias kipredshift="cd ${REPOS_DIR}/KIP-S3-To-Redshift-Ingestion"
alias kipterra="cd ${REPOS_DIR}/kepler-terraform"
alias kipdocs="cd ${REPOS_DIR}/TDS-Docs"
alias kipgoog="cd ${REPOS_DIR}/KIP-Googlesheet-Ingestion"
