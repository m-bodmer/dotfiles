# Need to install rbenv

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# export AWS_ACCESS_KEY_ID="[ENTER_KEY_HERE]"
# export AWS_SECRET_ACCESS_KEY="[ENTER_KEY_HERE]"

# Start rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# This makes cd=pushd
setopt AUTO_PUSHD

# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT

# LS after changing directory
function chpwd() {
    emulate -L zsh
    ls -a
}

# ALIASES
alias git=hub

alias cpwd="pwd | tr -d '\n' | pbcopy"
alias localip="ipconfig getifaddr en0"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
