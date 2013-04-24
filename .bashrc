# Check for an interactive session
[[ $- = *i* ]] || return

# git prompt script
[[ -f ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

# go gets go to remote, but local projects still in path too
export GOPATH=$HOME/go/remote:$HOME/go/local
export PATH+=:$HOME/bin:$HOME/go/remote/bin:$HOME/go/local/bin

for config in .aliases .functions .prompt; do
    [[ -r ~/$config ]] && . ~/"$config"
done
