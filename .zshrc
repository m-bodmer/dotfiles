eval "$(starship init zsh)"

# Aliases
alias cat='bat --paging=never'
alias cpwd="pwd | tr -d '\n' | pbcopy"
alias ls='eza --icons -F -H --group-directories-first --git'

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"

# Create placeholder functions for Node-related commands
lazy_load_nvm() {
  # Remove the placeholder functions so they don't loop
  unset -f nvm node npm npx pnpm

  # Load the real NVM and its completion source scripts
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  # Resume the original command the user typed
  "$@"
}

# Assign the lazy loader to trigger on these commands
nvm() { lazy_load_nvm nvm "$@" }
node() { lazy_load_nvm node "$@" }
npm() { lazy_load_nvm npm "$@" }
npx() { lazy_load_nvm npx "$@" }
pnpm() { lazy_load_nvm pnpm "$@" }

