autoload -U promptinit; promptinit
eval "$(starship init zsh)"

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Base16 Shell
BASE16_SHELL="$HOME/.base16-manager/chriskempson/base16-shell"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# Show description in completion menu
zstyle ":completion:*:descriptions" format "%B%d%b"

[ -f $HOME/.config/digitalocean ] && source $HOME/.config/digitalocean
[ -f $HOME/.config/homebrew ] && source $HOME/.config/homebrew

export GOPATH="$HOME/go"

# Force rbenv to always keep sources
export RBENV_BUILD_ROOT="$HOME/.rbenv/sources"
eval "$(rbenv init - --no-rehash)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH=".git/safe/../../bin:$PATH"

export FZF_DEFAULT_OPTS="--extended --cycle"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

export VISUAL=nvim
export EDITOR=$VISUAL

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^Y" accept-and-hold
bindkey "^Q" push-line-or-edit

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

setopt promptsubst

export TERM="xterm-256color-italic"

eval "$(direnv hook zsh)"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export FZF_DEFAULT_COMMAND='rg --files'

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
