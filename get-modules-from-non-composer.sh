allmodules="";
# Tweak these excluded as needed. Pesky modules, erroneous folders, etc. that are not modules.
# Keep in mind all files in the source folder will be scanned and use in the composer require statement.
excluded=("contrib" "custom" "README.txt" "platform" "config_split")
# Tweak location as needed for wherever script is being run.
for f in $(ls /Users/tylerfahey/Sites/pantheon-sites/wpccu2019/modules/contrib); do
  # TODO: Check if module is in excluded list and ignore if so.
  if [[ " ${excluded[@]} " =~ " ${f} " ]]; then
    # whatever you want to do when array contains value
    echo "ignoring $f"
  fi

  if [[ ! " ${excluded[@]} " =~ " ${f} " ]]; then
      # whatever you want to do when array doesn't contain value
      allmodules+=" drupal/$f"
  fi
  
done
echo "Running composer require $allmodules --fixed --update-no-dev -W --sort-packages"
composer require $allmodules