#!/usr/bin/env zsh

BREW_COMMAND=/usr/local/bin/brew

${BREW_COMMAND} link --force --overwrite mysql@5.7
${BREW_COMMAND} link --force --overwrite postgresql@9.6

exit 0
