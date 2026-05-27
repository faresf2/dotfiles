# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Source/Load Catppuccin syntax highlighting
# source ~/zsh/.zsh-theme/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/zsh/.zsh-theme/rose-pine.zsh

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux


# Load completions
autoload -Uz compinit && compinit

#aliases
alias nvf='fzf -m --preview="bat --color=always {}" | xargs -r nvim'
alias ls='eza -a --group-directories-first --no-filesize --no-user --no-time --no-permissions'
alias ll='eza -alh --no-time --git --icons --group-directories-first'
alias tree='eza -alh --tree --no-time --git --icons --group-directories-first'
alias remove='sudo pacman -Rs'
alias install='sudo pacman -S'
alias yremove='yay -Rs'
alias yinstall='yay -S'
alias vim='nvim'
alias svim='sudoedit'
alias c='clear'
alias grep='grep --color=auto'
alias nodeserver='npx http-server -c-1 -o -p 8080'

# History
HISTSIZE=5000
HISTFILE=/home/fares/zsh/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a --color $realpath'


bindkey -e
bindkey ^p history-search-backward
bindkey ^n history-search-forward

# Custom keybindings for word navigation
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word

# Bind Ctrl+Backspace to delete the previous word
bindkey '^H' backward-kill-word

# makes hidden files show in completion
setopt globdots

# Oh-my-posh
# eval "$(oh-my-posh init zsh --config /home/fares/.config/ohmyposh/catppuccin-mocha.omp.json)"
# eval "$(oh-my-posh init zsh --config /home/fares/.config/ohmyposh/tokyonight-storm.omp.json)"
eval "$(oh-my-posh init zsh --config /home/fares/.config/ohmyposh/huvix.omp.json)"
# eval "$(oh-my-posh init zsh --config /home/fares/.config/ohmyposh/zash.omp.json)"


export PATH=$PATH:/home/fares/.local/bin
export EDITOR=nvim
export PATH="$HOME/flutter-sdk/flutter/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/helium-browser"
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
