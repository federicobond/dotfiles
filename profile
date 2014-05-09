# Export aditional paths
export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:$HOME/bin:$PATH"

# Configure rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Configure tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export EDITOR='/usr/local/bin/vim'

# Export locale
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Export the Haskell cabal bin
export PATH=$PATH:$HOME/.cabal/bin

# Export go tools
export GOPATH="$HOME/code/go"

# Export pythonstartup script and python path
export PYTHONSTARTUP="$HOME/.pythonstartup"
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

# Export texlive
export PATH="$PATH:/usr/local/texlive/2013/bin/x86_64-darwin"
