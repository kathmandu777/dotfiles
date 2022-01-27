export PS1='\[\e[01;36m\]\w\[\e[01;32m\]$(__git_ps1 " (%s)" 2>/dev/null)\[\e[0m\] \$ '
export GIT_PS1_SHOWDIRTYSTATE=1

source ${HOME}/.git-completion.bash
source ${HOME}/.git-prompt.sh

__git_complete g __git_main
__git_complete gs _git_status
__git_complete gl _git_log
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gc _git_checkout
__git_complete gct _git_commit
__git_complete gcm _git_commit
__git_complete gd _git_diff
__git_complete gm _git_merge
__git_complete gm _git_branch
__git_complete gps _git_branch
__git_complete gps _git_push
__git_complete gpso _git_branch
__git_complete gpl _git_pull
__git_complete gpl _git_branch
__git_complete grb _git_rebase

__git_complete grs _git_reset
