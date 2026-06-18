# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
alias cat='bat --paging=never'
alias cpwd="pwd | tr -d '\n' | pbcopy"
alias ls='eza --icons -F -H --group-directories-first --git'

alias localip="ipconfig getifaddr en0"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Ruby version manager - Lazy loaded
rbenv() {
  unset -f rbenv ruby gem bundle irb
  eval "$(command rbenv init -)"
  rbenv "$@"
}
ruby() { rbenv && ruby "$@"; }
gem() { rbenv && gem "$@"; }
bundle() { rbenv && bundle "$@"; }
irb() { rbenv && irb "$@"; }

# Fast CD
eval "$(zoxide init zsh)"

# Mise
eval "$(/Users/mb/.local/bin/mise activate zsh)"

# Prioritize ~/.local/bin for native installations (e.g., Claude Code)
export PATH="$HOME/.local/bin:$PATH"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# Lazy-load SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unset -f sdk java gradle mvn kotlin
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}
java() { sdk && java "$@"; }
gradle() { sdk && gradle "$@"; }
mvn() { sdk && mvn "$@"; }
kotlin() { sdk && kotlin "$@"; }
