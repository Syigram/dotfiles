# Reminder Function - Similar to a todo

function reminder() {
  echo "(1) Before developing on Drupal, run command: envdrupal"
  echo "(2) Recommended way for installing Drupal modules:\n  - Download with Composer\n  - Install with drush en module_name"
  echo "(3) drush cache-rebuild: it's the new cc all"
}

function tips() {
    case $1 in
       drupal)
         echo "drush en module_name: to enable modules"
         echo "drush cache-rebuild: rebuilds cache"
         ;;
       vim)
         echo ":help preview-window => for showing code previews and docs"
         ;;
       *.exe)       cabextract $1  ;;
     esac

}


# Clubhouse story template
function clubhouse() {
  echo -e "## Objective\n## Value\n## Acceptance Criteria" | pbcopy
}

# Takes 1 argument and adds it to the beginning of the PATH
function path_ladd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

# Takes 1 argument and adds it to the end of the PATH
function path_radd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# Reload bashrc
function so() {
  source ~/.zsh/.zshrc
}

function clear_and_list(){
  if [[ -n $1 ]]; then
    clear
    ls -alhF --color=auto | grep -i $1
  else
    clear
    ls -alhF --color=auto
  fi
}

function poetry_add_all(){
  for item in $(cat $1); do
    poetry add "${item}"
  done
}


# Reloads ~/.zshrc.
function reload() {
  source "$HOME/.zsh/.zshrc"
}

# Displays human readable disk usage.
function duh() {
  (( $# == 0 )) && set -- *
  if [[ "$OSTYPE" == linux* ]]; then
    du -khsc "$@" | sort -h -r
  else
    du -kcs "$@" | awk '{ printf "%9.1fM    %s\n", $1 / 1024, $2 } ' | sort -n -r
  fi
}

function findd() {
  find $1 -type d -name "$2"
}

function findf() {
  find $1 -name "$2"
}


function spaceship_pyenv() {
  # Show pyenv python version only for Python-specific folders
  [[ -n "$PYENV_VERSION" || -f .python-version || -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] || return

  local pyenv_status=${$(pyenv version-name 2>/dev/null)//:/ }
  echo $pyenv_status

  # spaceship::section \
  #   "$SPACESHIP_PYENV_COLOR" \
  #   "$SPACESHIP_PYENV_PREFIX" \
  #   "${SPACESHIP_PYENV_SYMBOL}${pyenv_status}" \
  #   "$SPACESHIP_PYENV_SUFFIX"
}

zshaddhistory() {  whence ${${(z)1}[1]} >/dev/null || return 2 }

function batterylinux () {
GRML_BATTERY_LEVEL=''
local batteries bat capacity
batteries=( /sys/class/power_supply/BAT*(N) )
if (( $#batteries > 0 )) ; then
    for bat in $batteries ; do
        if [[ -e $bat/capacity ]]; then
            capacity=$(< $bat/capacity)
        else
            typeset -F energy_full=$(< $bat/energy_full)
            typeset -F energy_now=$(< $bat/energy_now)
            typeset -i capacity=$(( 100 * $energy_now / $energy_full))
        fi
        case $(< $bat/status) in
        Charging)
            GRML_BATTERY_LEVEL+=" ^"
            ;;
        Discharging)
            if (( capacity < 20 )) ; then
                GRML_BATTERY_LEVEL+=" !v"
            else
                GRML_BATTERY_LEVEL+=" v"
            fi
            ;;
        *) # Full, Unknown
            GRML_BATTERY_LEVEL+=" ="
            ;;
        esac
        GRML_BATTERY_LEVEL+="${capacity}%%"
    done
    echo $GRML_BATTERY_LEVEL
fi
}

# Extract Files
function extract() {
  if [ -f $1 ] ; then
    case $1 in
       *.tar.bz2)   tar xvjf $1    ;;
       *.tar.gz)    tar xvzf $1    ;;
       *.tar.xz)    tar xvJf $1    ;;
       *.bz2)       bunzip2 $1     ;;
       *.rar)       unrar x $1     ;;
       *.gz)        gunzip $1      ;;
       *.tar)       tar xvf $1     ;;
       *.tbz2)      tar xvjf $1    ;;
       *.tgz)       tar xvzf $1    ;;
       *.zip)       unzip $1       ;;
       *.Z)         uncompress $1  ;;
       *.7z)        7z x $1        ;;
       *.xz)        unxz $1        ;;
       *.exe)       cabextract $1  ;;
       *)           echo "\`$1': unrecognized file compression" ;;
    esac
  else
    echo "\`$1' is not a valid file"
  fi
}
