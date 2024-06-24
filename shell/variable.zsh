PATH="$PATH:""$HOME"'/.yarn/bin/'
PATH="$PATH:""$HOME"'/.composer/vendor/bin/'
PATH="$PATH:""$HOME"'/.config/composer/vendor/bin/'
PATH="$PATH:"'/opt/homebrew/opt/mysql-client/bin'
PATH="$PATH:""$HOME"'/.config/phpmon/bin'
PATH="$PATH:""$HOME"'/.local/share/flutter/bin'
PATH="$PATH:""$HOME"'/.local/bin'
PATH="$PATH:""$HOME"'/Library/Android/emulator'
PATH="$PATH:""$HOME"'/Library/Android/platform-tools'
PATH="$PATH:""$HOME"'/.jenv/bin'
PATH="$PATH:""$HOME"'/.pub-cache/bin'
PATH="$PATH:""$HOME"'/.bun/bin'
PATH="$PATH:""$HOME"'/Library/Application\ Support/JetBrains/Toolbox/scripts'
PATH="$PATH:""$HOME"'/.docker/bin'

export COMPOSER_ALLOW_SUPERUSER="1"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export MYSQL_ROOT_PASSWORD="exploded"

NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR
