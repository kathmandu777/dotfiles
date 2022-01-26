alias so='source'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias py='python3'
alias python='python3'
alias pip='pip3'

alias vs='code .'

alias p='cd $HOME/projects'

alias c='clear'

alias d='docker'

# python venv
alias activate='source venv/bin/activate'

export PS1='\[\e[01;36m\]\w\[\e[01;32m\]$(__git_ps1 " (%s)" 2>/dev/null)\[\e[0m\] \$ '
export GIT_PS1_SHOWDIRTYSTATE=1