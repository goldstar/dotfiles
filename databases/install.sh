#!/usr/bin/env zsh

BREW_COMMAND=$(which brew)

echo
echo "Force linking mysql and postgresql for their respective headers"
echo
${BREW_COMMAND} link --force --overwrite mysql@5.7
${BREW_COMMAND} link --force --overwrite postgresql

exit 0
