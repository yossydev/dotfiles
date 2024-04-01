# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# zsh-autosuggestions
# source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# general
alias la='ls -la'
alias vzr='nvim ~/.zshrc'
alias szr='source ~/.zshrc'

# for peco 
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

function peco-git-branch () {
    local branch=$(git branch --sort=-authordate | peco --prompt "GIT BRANCH>" | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
      if [ -n "$LBUFFER" ]; then
        local new_left="${LBUFFER%\ } $branch"
      else
        local new_left="$branch"
      fi
      BUFFER=$(echo ${new_left}${RBUFFER} | tr '\n' ' ')
      CURSOR=${#new_left}
    fi
}
zle -N peco-git-branch
zle -N peco-history-selection

bindkey '^g' peco-git-branch
bindkey '^R' peco-history-selection

# docker
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dmu='make docker-up'
alias dmd='make docker-down'
alias dml='make docker-log'

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
alias pn="pnpm"
alias pni="pnpm install"
alias pna="pnpm add"
alias pnad="pnpm add -D"
alias pnd="pnpm dev"
alias pnb="pnpm build"
alias pns="pnpm start"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# yarn
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add -D'
alias yd='yarn dev'
alias yb='yarn build'
alias ys='yarn start'

# npm
alias ni="npm install"
alias nr="npm run"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrs="npm run start"

# zoxide
eval "$(zoxide init zsh)"

# gitmoji
alias gmoji="gitmoji -c"

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# StarShip
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"

## neovim
alias v='nvim'

# android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# jEnv
export PATH="$JENV_HOME/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
eval "$(jenv init -)"

# Flutter
export PATH="$PATH:`pwd`/flutter/bin"

# Flutter Version Management
export PATH="$PATH:$HOME/.pub-cache/bin"

# gh
eval "$(gh completion -s zsh)"

# go
export PATH="$HOME/go/bin:$PATH"

# volta (uninstall)
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# bun completions
[ -s "/Users/yy/.bun/_bun" ] && source "/Users/yy/.bun/_bun"


[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
