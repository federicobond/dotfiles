# Configure rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Configure tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export EDITOR='/usr/local/bin/vim'

# Export aditional paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Export locale
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Export homebrew temp directory
export HOMEBREW_TEMP='/tmp'

# Export the Haskell cabal bin
export PATH=$PATH:$HOME/.cabal/bin

# Export go tools
export GOPATH="$HOME/code/go"

# Export node and npm paths
export NODE_PATH='/usr/local/lib/node_modules'
export PATH="$PATH:/usr/local/share/npm/bin"

# Export python tools path
export PATH="$PATH:/usr/local/share/python"

# Export pythonstartup script
export PYTHONSTARTUP="$HOME/.pythonstartup"

# Export Postgres.app binary path
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Export Heroku Toolbelt path
export PATH="/usr/local/heroku/bin:$PATH"

# Configure tmux to start or reattach to session automatically
if [[ -z $TMUX ]] then
    tmux attach-session -t "$USER" || tmux new-session -s "$USER"
    exit
fi
