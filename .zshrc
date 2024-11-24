# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up Home Brew for Mac
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set up where we want to install zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not already there
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Initialize zinit
source "${ZINIT_HOME}/zinit.zsh"

# Initialize Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Setup Powerlevel10K Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets (oh-my-zsh plugins)
zinit snippet OMZP::git
zinit snippet OMZP::postgres
zinit snippet OMZP::sudo
zinit snippet OMZP::rbenv
zinit snippet OMZP::ruby
zinit snippet OMZP::npm
zinit snippet OMZP::nvm
zinit snippet OMZP::rails
zinit snippet OMZP::bundler
zinit snippet OMZP::gem
zinit snippet OMZP::rake
zinit snippet OMZP::heroku
zinit snippet OMZP::node
zinit snippet OMZP::command-not-found
zinit snippet OMZP::aws
zinit snippet OMZP::brew
zinit snippet OMZP::fzf
zinit snippet OMZP::rust
zinit snippet OMZP::dotenv
zinit snippet OMZP::1password

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^h' history-search-backward
bindkey '^l' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Setup History Date Format
HIST_STAMPS="yyyy-mm-dd"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Setup 1Password SSH Agent
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Set aliases
alias edconfig="$EDITOR $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias ll="ls -al --color"
alias home="cd $HOME"
alias c='clear'
alias gitco='git checkout'
alias gitbr='git branch'
alias gitst='git status'
alias gitadd='git add -A'
alias gitcom='git commit -am'

# Added by `rbenv init` on Fri Nov 22 08:44:20 PST 2024
eval "$(rbenv init - --no-rehash zsh)"

# Init Rust
export PATH=$HOME/cargo/bin:$PATH
. "$HOME/.cargo/env"

# Setup Postgres
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
source /Users/shreds/.config/op/plugins.sh
