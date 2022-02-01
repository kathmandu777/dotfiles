#!/bin/bash

function usage () {
    echo "Usage: $0 [COMMAND]"
    echo "Commands:"
    echo "  link: Link dotfiles to home directory"
    echo "  unlink: Unlink dotfiles from home directory"
    echo "  bash: Setup for bash"
    echo "  zsh: Setup for zsh"
    echo "  vscode: Setup for vscode"
    echo "  save_vscode_extensions: Save installed vscode extensions to vscode/extensions.txt"
    echo "  install_vscode_extensions: Install vscode extensions from vscode/extensions.txt"
    echo "  install_gh: Install gh which is GitHub CLI"
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

function link_vscode_config () {
    case $(uname -s) in
        Linux*)
            VSCODE_CONFIG_DIR="${HOME}/.config/Code/User"
            ;;
        Darwin*)
            VSCODE_CONFIG_DIR="${HOME}/Library/Application\ Support/Code/User"
            ;;
        *)
            echo "Unknown OS"
            exit 0
            ;;
    esac

    # vscodeの設定をシンボリックリンク
    ln -snfv ${DOTFILES_DIR}/vscode/settings.json ${VSCODE_CONFIG_DIR}/settings.json
    ln -snfv ${DOTFILES_DIR}/vscode/keybindings.json ${VSCODE_CONFIG_DIR}/keybindings.json
}

function save_vscode_extensions () {
    code --list-extensions > ${DOTFILES_DIR}/vscode/extensions.txt
}

function install_vscode_extensions () {
    cat ${DOTFILES_DIR}/vscode/extensions.txt | while read line
    do
        code --install-extension $line
    done
}

function install_fzf () {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function install_gh () {
    case $(uname -s) in
        Linux*)
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
            sudo apt update
            sudo apt install gh
            ;;
        Darwin*)
            brew install gh
            ;;
        *)
            echo "Unknown OS"
            exit 0
            ;;
    esac
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
                install_gh
                link
                ;;
            zsh)
                install_zsh
                install_fzf
                install_gh
                link
                ;;
            vscode)
                link_vscode_config
                ;;
            save_vscode_extensions)
                save_vscode_extensions
                ;;
            install_vscode_extensions)
                install_vscode_extensions
                ;;
            install_gh)
                install_gh
                ;;
            install_fzf)
                install_fzf
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