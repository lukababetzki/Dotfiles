# =============================================================================
# zsh/.zshrc
# =============================================================================
# Prompt:  Pure
# Plugins: zsh-autosuggestions, zsh-syntax-highlighting
# =============================================================================


# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS       # don't record duplicate consecutive entries
setopt HIST_IGNORE_SPACE      # don't record entries starting with a space
setopt HIST_VERIFY            # show history expansion before executing
setopt SHARE_HISTORY          # share history across sessions


# -----------------------------------------------------------------------------
# General options
# -----------------------------------------------------------------------------

setopt AUTO_CD                # type a directory name to cd into it
setopt CORRECT                # suggest corrections for mistyped commands
setopt NO_BEEP                # no terminal bell
setopt INTERACTIVE_COMMENTS   # allow comments in interactive shell


# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # case-insensitive
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:descriptions' format '%F{cyan}%d%f'


# -----------------------------------------------------------------------------
# Pure prompt
# -----------------------------------------------------------------------------
# Install: sudo dnf install zsh-pure-prompt
# or manually: https://github.com/sindresorhus/pure
# -----------------------------------------------------------------------------

fpath+=("$(brew --prefix)/share/zsh/site-functions" /usr/share/zsh/site-functions)
autoload -U promptinit
promptinit
prompt pure

# Colour overrides — match design system
zstyle ':prompt:pure:prompt:success'    color '#ccf4ef'
zstyle ':prompt:pure:prompt:error'      color '#cc4444'
zstyle ':prompt:pure:git:branch'        color '#8dddd5'
zstyle ':prompt:pure:git:dirty'         color '#efcc7a'
zstyle ':prompt:pure:path'              color '#fefefe'
zstyle ':prompt:pure:host'              color '#888888'
zstyle ':prompt:pure:user'              color '#888888'
zstyle ':prompt:pure:user:root'         color '#cc4444'


# -----------------------------------------------------------------------------
# Plugins
# -----------------------------------------------------------------------------
# Install on Fedora:
#   sudo dnf install zsh-autosuggestions zsh-syntax-highlighting
# -----------------------------------------------------------------------------

# zsh-autosuggestions
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#444444'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh-syntax-highlighting — must be sourced last
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_HIGHLIGHT_STYLES[command]='fg=#ccf4ef'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#ccf4ef'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ccf4ef'
ZSH_HIGHLIGHT_STYLES[function]='fg=#8dddd5'
ZSH_HIGHLIGHT_STYLES[path]='fg=#fefefe,underline'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#cc4444'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#efcc7a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#efcc7a'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#444444'


# -----------------------------------------------------------------------------
# Keybindings
# -----------------------------------------------------------------------------

bindkey -e                              # emacs-style line editing

bindkey '^[[A' history-search-backward  # up arrow — history search
bindkey '^[[B' history-search-forward   # down arrow — history search
bindkey '^[[H' beginning-of-line        # home
bindkey '^[[F' end-of-line              # end
bindkey '^[[3~' delete-char             # delete


# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

# Safety nets
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Sway / Wayland
alias sway-reload='swaymsg reload'
alias sway-exit='swaymsg exit'

# Editors
alias e='$EDITOR'

# Misc
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias path='echo $PATH | tr ":" "\n"'


# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export EDITOR=nano              # change to nvim/vim/zed as preferred
export VISUAL=$EDITOR
export PAGER=less
export LESS='-R --use-color'

# Wayland
export MOZ_ENABLE_WAYLAND=1     # Firefox on Wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Path additions
export PATH="$HOME/.local/bin:$PATH"


# =============================================================================
# end of .zshrc
# =============================================================================
