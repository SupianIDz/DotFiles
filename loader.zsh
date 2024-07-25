isMacOS() {
  [[ "$(uname)" == "Darwin" ]]
}

for file in ~/.dotfiles/shell/{variable,xaliases,function}.zsh; do
	# shellcheck source=./${file}
	[ -r "$file" ] && [ -f "$file" ] && source "${file}"
done

if isMacOS; then

  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  eval "$(jenv init -)"
fi