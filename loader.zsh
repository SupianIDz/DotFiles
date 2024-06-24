for file in ~/.dotfiles/shell/{variable,xaliases,function}.zsh; do
	# shellcheck source=src/util.sh
	[ -r "$file" ] && [ -f "$file" ] && source "${file}"
done