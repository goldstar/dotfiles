#!/usr/bin/env sh
#
# Sublime
#
# Installs default plugins and user preferences for sublime text

export DOTHOME=${HOME}/.dotfiles
JQ_COMMAND=$(which jq)

DISTRO=$(uname -s)
case ${DISTRO} in
  'Linux')
    SUBLIME_DIR="${HOME}/.config/sublime-text-3/Packages/User"
    if ! command -v ${JQ_COMMAND} 2> /dev/null; then apt-get install jq; fi
    ;;
  'Darwin')
    SUBLIME_DIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
    if ! command -v ${JQ_COMMAND} 2> /dev/null; then brew install jq; fi
    ;;
  *)
    echo "Good luck with that"
    ;;
esac

if [ ! -d "$SUBLIME_DIR" ]; then
  echo "Sublime is not installed"
  exit 1
fi

USER_PREFERENCES="${HOME}/.sublime-settings.local"

# Merging User Settings files
FINAL_SUBLIME_SETTINGS="${SUBLIME_DIR}/Preferences.sublime-settings"

if [ -f ${USER_PREFERENCES} ]; then
  cp "${SUBLIME_DIR}/Preferences.sublime-settings{,.backup}"
  jq -s add . "${USER_PREFERENCES}" "${DOTHOME}/sublime/Preferences.sublime-settings" > "${FINAL_SUBLIME_SETTINGS}"
else
  cp "${DOTHOME}/sublime/Preferences.sublime-settings" "${FINAL_SUBLIME_SETTINGS}"
fi

# Merging Package Settings
SUBLIME_PACKAGES="${SUBLIME_DIR}/Package Control.sublime-settings"

cp "${SUBLIME_PACKAGES}" "${SUBLIME_PACKAGES}.backup"

NEW_PREFERENCES=$(jq -s '[.[]]' "${SUBLIME_PACKAGES}" "${DOTHOME}/sublime/Package Control.sublime-settings" | jq '.[0].installed_packages=([.[].installed_packages]|flatten|unique)|.[0]')

echo ${SUBLIME_PACKAGES} > "${NEW_PREFERENCES}"

