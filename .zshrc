# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra,cli}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(pyenv init -)"
autoload -U compinit; compinit

# session-wise fix
ulimit -n 4096

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:path color white

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(jenv init -)"

eval "$(/opt/homebrew/bin/brew shellenv)"
