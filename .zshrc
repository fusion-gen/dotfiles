#
# ~/.zshrc
#
export PATH="$HOME/.cargo/bin:$PATH"

HISTFILE="$HOME/.zsh_history"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f ~/.cache/wallust/sequences ]] && cat ~/.cache/wallust/sequences

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -f ~/.config/zsh/config.zsh ]] && source ~/.config/zsh/config.zsh

