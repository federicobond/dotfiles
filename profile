export EDITOR='/usr/local/bin/vim'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Configure tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Export the Haskell cabal bin
export PATH=$PATH:$HOME/.cabal/bin

# Export go tools
export GOPATH="$HOME/code/go"

# Export pythonstartup script and python path
export PYTHONSTARTUP="$HOME/.pythonstartup"
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
