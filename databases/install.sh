#!/usr/bin/env zsh

BREW_COMMAND=/usr/local/bin/brew

echo
echo "Force linking mysql and postgresql for their respective headers"
echo
${BREW_COMMAND} link --force --overwrite mysql@5.7
${BREW_COMMAND} link --force --overwrite postgresql@9.6

exit 0
