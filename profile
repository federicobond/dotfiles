# Configure rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Configure tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Configure tmux to start or reattach to session automatically
if [[ -z $TMUX ]] then
    tmux attach-session -t "$USER" || tmux new-session -s "$USER"
    exit
fi

# Export aditional paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"

export EDITOR='/usr/local/bin/vim'

export NODE_PATH='/usr/local/lib/node_modules'

export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export HOMEBREW_TEMP='/tmp'

# Export the Haskell cabal bin
export PATH=$PATH:$HOME/.cabal/bin

# Alias update command
alias up="brew update && brew upgrade"

# Export go tools
export GOROOT="/usr/local/Cellar/go/1.0.3"
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Export npm path
export PATH="$PATH:/usr/local/share/npm/bin"

# Export python tools path
export PATH="$PATH:/usr/local/share/python"

# Export Postgres.app binary path
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Export Heroku Toolbelt path
export PATH="/usr/local/heroku/bin:$PATH"
