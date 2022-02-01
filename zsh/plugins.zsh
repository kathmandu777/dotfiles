# theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# suggestion
zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept # accept suggestion with ctrl + space

# completion
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

# zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# enhancd
zinit light b4b4r07/enhancd