#!/usr/bin/env zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

NODES_TO_INSTALL=(13.0.1 10.15.0)
DEFAULT_NODE_VERSION=${NODES_TO_INSTALL[0]}

echo "Installing nodes"
for node_ver in ${NODES_TO_INSTALL[*]}; do
  ls -x ${HOME}/.nvm/versions/node | grep ${node_ver} 2> /dev/null
  if [[ "$?" -eq "1" ]]; then
    echo "Installing: node-${node_ver}"
    nvm install ${node_ver}
  else
    echo "node-${node_ver} already installed"
  fi
done

echo "Setting default node to ${DEFAULT_NODE_VERSION}"
echo ${DEFAULT_NODE_VERSION} > $HOME/.node-version
