autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list ''

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[command]='fg=4'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=default'
