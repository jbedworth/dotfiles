# Setup History Date Format
HIST_STAMPS="yyyy-mm-dd"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Setup 1Password SSH Agent
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Setup 1Password .env ::: This .env file is etherial and managed by 1Password
# IMPORTANT:  DO NOT SAVE CREDENTIALS OR SECRETS IN ANY CONFIGURATION FILE
# USE 1Password Developer Tools Environments instead!!!!!!!!!!
source ~/.env


# Set aliases
alias vim="nvim"
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
alias bindevlog='bin/dev 2>&1 | /usr/sbin/rotatelogs -n 2 log/dev.log 10M'
alias taildevlog='tail -f log/dev.log'

# Init Rust
export PATH=$HOME/cargo/bin:$PATH
. "$HOME/.cargo/env"

# Setup asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# Setup Postgres
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/john/.lmstudio/bin"
# End of LM Studio CLI section

# Ollama Settings
export OLLAMA_HOST="192.168.1.74:11434"

export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity CLI installer
export PATH="/Users/john/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/john/.antigravity-ide/antigravity-ide/bin:$PATH"
