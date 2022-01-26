source ${HOME}/.git-completion.bash
source ${HOME}/.git-prompt.sh

# git
alias g='git'
__git_complete g __git_main

# status
alias gs='git status'
__git_complete gs _git_status

# gl
alias gl='git log'
__git_complete gl _git_log

# add
alias ga='git add'
__git_complete ga _git_add

# branch
alias gb='git branch'
__git_complete gb _git_branch

# checkout
alias gc='git checkout'
__git_complete gc _git_checkout

# commit
alias gct='git commit'
__git_complete gct _git_commit
alias gcm='git commit -m'
__git_complete gcm _git_commit

# diff
alias gd='git diff'
__git_complete gd _git_diff

# fetch
alias gfo='git fetch origin'
#__git_complete gfe _git_fetch

# merge
alias gm='git merge'
__git_complete gm _git_merge
__git_complete gm _git_branch

# push
alias gps='git push'
__git_complete gps _git_push
__git_complete gps _git_branch
alias gpso='git push origin'
__git_complete gpso _git_branch
alias gpsoh='git push origin HEAD'
alias gpsfoh='git push -f origin HEAD'
alias gpsfloh='git push --force-with-lease origin HEAD'

# pull
alias gpl='git pull'
__git_complete gpl _git_pull
__git_complete gpl _git_branch
alias gplf='git fetch;git reset --hard origin/$(git symbolic-ref --short HEAD)'

# stash
alias gst='git stash'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gssu='git stash save -u'

# rebase
alias grb='git rebase'
__git_complete grb _git_rebase

# reset
alias grs='git reset'
__git_complete grs _git_reset
alias grss^='git reset --soft HEAD^'
alias grss^^='git reset --soft HEAD^^'
alias grsh^='git reset --hard HEAD^'
alias grsh^^='git reset --hard HEAD^^'

# remove branch merged except main, master, develop
alias gbrm="git branch --merged|egrep -v '\*|main|master|develop|dev|release'|xargs git branch -d"
