# misc
alias so='source'
alias c='clear'
alias vs='code .'
alias tf='terraform'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls='ls -F --color=auto'
alias lsl='ls -lh --color=auto --time-style="+%Y/%m/%d %H:%M:%S"'
alias ll='ls -lh --color=auto --time-style="+%Y/%m/%d %H:%M:%S"'
alias la='ls -aF --color=auto'
alias lsa='ls -aF --color=auto'
alias lsla='ls -lah --color=auto --time-style="+%Y/%m/%d %H:%M:%S"'
alias lsal='ls -alh --color=auto --time-style="+%Y/%m/%d %H:%M:%S"'
if [ `uname` = "Darwin" ]; then # Mac OS X (--time-style)
    alias ls='gls'
fi

# python
alias py='python3'
alias python='python3'
alias pip='pip3'
alias activate='source venv/bin/activate'

# dir path
alias p='cd $HOME/projects'
alias dot='cd $HOME/dotfiles'

# docker
alias d='docker'
alias dc='docker-compose' # dc commandが存在するがほぼ使用しないので上書きする

# apt
alias api='sudo apt install'
alias apu='sudo apt update'