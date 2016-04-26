#enable git auto complete via [brew install bash-completion]
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi


HISTSIZE=100000
HISTFILESIZE=100000


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='[\u@\h: \w$(__git_ps1)]\$ '
export PS1='[\u@\h: \W$(__git_ps1)]\$ '

      
#git tab completion (homebrew)
#if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
#    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
#fi


# jenv config
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# for some reason terminal in mac doesn't source .bashrc
# where by default the nvm installation  apended the below two lines.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# RVM config
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


