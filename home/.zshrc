eval "$(starship init zsh)"
[[ $EMACS = t ]] && unsetopt zle

# common day
# ls, the common ones I use a lot shortened for rapid fire usage
alias s='ssh'
alias l='exa -lFh --git'     # size, show type, human readable, git
alias lr='exa -tRFh'   #sorted by date,recursive,show type,human readable
alias ldot='exa -ld .*'
alias dotgit='/usr/bin/git --git-dir=$HOME/Repos/macconfig/home/ --work-tree=$HOME'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias findd='find . -type d -name'
alias findf='find . -type f -name'

alias gst='git status -v'
alias gcm='git checkout master'
alias gl='git pull -v'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Brew alias
alias brewp='brew pin'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias bcubo='brew update && brew cask outdated'
alias bcubc='brew cask reinstall $(brew cask outdated) && brew cleanup'

# source it
alias zz="source ~/.zshrc"

HISTFILESIZE=10000               # Settings the history size

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="${PATH}:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
fi

export VISUAL=emacs
export EDITOR=emacs
export GIT_EDITOR=emacs
export PATH="${PATH}:${HOME}/.local/bin"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

pr () {
    if [ $# -eq 0 ]
    then
        gh pr list -L 20 --format='%I [%au] %t %n' | fzf | cut -d' ' -f1 | xargs hub pr checkout
    else
        gh pr checkout $1
    fi
}
if [ $(sysctl hw.machine | awk '{print $2}') = "arm64" ]; then
    echo 'Silicon Mac mode'
    export PATH="${PATH}:/opt/homebrew/bin"
    export ARCHFLAGS='-arch arm64'
fi
