#!/bin/bash

function usage () {
    echo "Usage: $0 [COMMAND]"
    echo "Commands:"
    echo "  link: Link dotfiles to home directory"
    echo "  unlink: Unlink dotfiles from home directory"
    echo "  bash: Setup for bash"
    echo "  zsh: Setup for zsh"
    echo "  help  |  -h  |  --help: Print usage"
}

function link () {
    for filename in .??*; do
        [ ${filename} = ".git" ] && continue
        [ ${filename} = ".gitignore" ] && continue
        [ ${filename} = ".github" ] && continue

        # シンボリックリンクを貼る
        ln -snfv ${DOTFILES_DIR}/${filename} ${HOME}/${filename}
    done
}

function unlink () {
    for filename in .??*; do
        [ ${filename} = ".git" ] && continue
        [ ${filename} = ".gitignore" ] && continue
        [ ${filename} = ".github" ] && continue

        # シンボリックリンクを削除
        rm ${HOME}/${filename}
    done
}

function install_git_tools () {
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
    chmod a+x ${HOME}/.git-completion.bash
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
    chmod a+x ${HOME}/.git-prompt.sh
}

function install_zsh () {
    # zshをインストール
    case $(uname -s) in
        Linux*)
            sudo apt-get install zsh -y
            ;;
        Darwin*)
            brew install zsh
            ;;
        *)
            echo "Unknown OS"
            exit 0
            ;;
    esac

    # zshをデフォルトにする
    chsh -s $(which zsh)
}

function main () {
    if [ $# -eq 0 ]; then
        usage
    else
        case $1 in
            link)
                link
                ;;
            unlink)
                unlink
                ;;
            bash)
                install_git_tools
                link
                ;;
            zsh)
                install_zsh
                link
                ;;
            help|--help|-h)
                usage
                ;;
            *)
                echo -e "[ERROR] unknown command: $1\n"
                usage
                ;;
        esac
    fi
}

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
main "$@"