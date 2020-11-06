export EDITOR='vim'
export VISUAL="$EDITOR"
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Configure tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Export the Haskell cabal bin
export PATH=$PATH:$HOME/.cabal/bin

# Export MacTeX path
export PATH=$PATH:/Library/TeX/texbin

# Export Python paths
export PATH=$PATH:/Users/federicobond/Library/Python/3.6/bin
export PATH=$PATH:/Users/federicobond/Library/Python/2.7/bin

# Export go tools
export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin
export CDPATH=$CDPATH:/Users/federicobond/code/go/src

# Export pythonstartup script and python path
export PYTHONSTARTUP="$HOME/.pythonstartup"
# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home/

export ANDROID_HOME=/Users/federicobond/Library/Android/sdk
export ANDROID_NDK_HOME=/Users/federicobond/Library/Android/sdk/ndk/21.3.6528147
export ANDROID_SDK_ROOT=/Users/federicobond/Library/Android/sdk
export ANDROID_NDK_ROOT=/Users/federicobond/Library/Android/sdk/ndk/21.3.6528147

export PATH="/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export JAVA_HOME=$(/usr/libexec/java_home -v1.8)


function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
