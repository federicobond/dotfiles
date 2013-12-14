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

# Export pythonstartup script and python path
export PYTHONSTARTUP="$HOME/.pythonstartup"
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

# Export Postgres.app binary path
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Export ~/bin path
export PATH="$PATH:$HOME/bin"

# Alias hub to git
eval "$(hub alias -s)"
