# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra,cli}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(pyenv init -)"
# autoload -U compinit; compinit
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
compdef k=kubectl

# session-wise fix
ulimit -n 4096

# fpath+=($HOME/.zsh/pure)
# autoload -U promptinit; promptinit
# prompt pure
# zstyle :prompt:pure:path color white

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(jenv init -)"

#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable vim mode in your shell
bindkey -v
export KEYTIMEOUT=1
eval "$(starship init zsh)"