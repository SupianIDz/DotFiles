function pint() {
    if [ -f "./pint" ]; then
        ./pint "$@"
    else
        vendor/bin/pint "$@"
    fi
}

function db() {
  if [ "$1" = "create" ]; then
    if mysql -h "$MYSQL_HOST" -P 3306 -u root -p"$MYSQL_PASS" -e "DROP DATABASE IF EXISTS $2; CREATE DATABASE $2"; then
      echo "DATABASE $2 SUCCESSFULLY CREATED."
    else
      echo "FAILED TO CREATE DATABASE $2."
    fi
  elif [ "$1" = "drop" ]; then
    if mysql -h "$MYSQL_HOST" -P 3306 -u root -p"$MYSQL_PASS" -e "DROP DATABASE $2"; then
      echo "DATABASE $2 SUCCESSFULLY DROPPED."
    else
      echo "FAILED TO DROP DATABASE $2."
    fi
  elif [ "$1" = "list" ]; then
    if mysql -h "$MYSQL_HOST" -P 3306 -u root -p"$MYSQL_PASS" -e "SHOW DATABASES"; then
      echo "DATABASES LISTED SUCCESSFULLY."
    else
      echo "FAILED TO LIST DATABASES."
    fi
  elif [ "$1" = "import" ]; then
    if mysql -h "$MYSQL_HOST" -P 3306 -u root -p"$MYSQL_PASS" $2 <$3; then
      echo "DATABASE $2 SUCCESSFULLY IMPORTED FROM $3."
    else
      echo "FAILED TO IMPORT DATABASE $2 FROM $3."
    fi
  elif [ "$1" = "export" ]; then
    if mysqldump -h "$MYSQL_HOST" -P 3306 -u root -p"$MYSQL_PASS" $2 >$3; then
      echo "DATABASE $2 SUCCESSFULLY EXPORTED TO $3."
    else
      echo "FAILED TO EXPORT DATABASE $2 TO $3."
    fi
  else
    echo "No arguments provided. Please provide the necessary arguments."
    echo "Usage:"
    echo "create <database>: to create a new database."
    echo "drop <database>: to drop an existing database."
    echo "list: to list all databases."
    echo "import <database> <file>: to import a database from a file."
    echo "export <database> <file>: to export a database to a file."
  fi
}

function phpv() {
  if isMacOS; then

    local desired=$1
    local available=(
      "8.4"
      "8.3"
      "8.2"
      "8.1"
      "8.0"
      "7.4"
      "7.3"
      "7.2"
      "7.1"
      "7.0"
      "5.6"
    )

    # Check if the desired PHP version is available
    if [[ " ${available[*]} " == *" $desired "* ]]; then
      # Unlink all versions of PHP
      for version in "${available[@]}"; do
        if [[ "$version" != "$desired" ]]; then
          brew unlink "php@$version" 2>/dev/null
        fi
      done

      # Link the desired PHP version
      brew link "php@$desired" --force --overwrite &>/dev/null

      # Check the PHP version
      php -v
    else
      echo "PHP version $desired is not available."
    fi
  else
    sudo update-alternatives --config php
  fi
}

function unrar() {
  find . -name '*.rar' -execdir unar -s -p $1 {} \;
}
