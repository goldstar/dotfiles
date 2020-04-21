# ~/aliases.zsh
# vim:set ft=sh sw=2 sts=2:

muxable_paths=(${SOURCE_DIR}/gs)

mux() {
  local name cols
  if [ -n "$1" ]; then
    cd $1
  fi
  name="$(basename ${PWD} | sed -e 's/\./-/g')"

  mux_file="${PWD}/.mux"
  [ -f ${mux_file} ] || mux_file="${HOME}/.mux"

  if ! $(tmux has-session -t ${name} &>/dev/null); then
    cols="$(tput cols)"
    cd $1
    tmux new-session -d -n code -s ${name} -x${cols-150} -y50 'reattach-to-user-namespace -l zsh'
    echo "Creating tmux session for ${name}"
    name=${name} source ${mux_file}
  fi

  tmux attach-session -t ${name}
}

mate() {
  local name cols
  if [ -n "$1" ]; then
    cd $1
  fi
  name="TMATE-$(basename $PWD | sed -e 's/\./-/g')"
  cols="$(tput cols)"
  tmate_cmd="/usr/local/bin/tmate"
  if ! $(${tmate_cmd} -f ${HOME}/.tmux.conf -S /tmp/${name}.sock has-session -t $name &>/dev/null); then
    ${tmate_cmd} -S /tmp/${name}.sock new-session -d -n code -s ${name} -x${cols-150} -y50 \; \
      new-window -a -d -n tests \; \
      new-window -d -n server \; \
      split-window -h -t ${name}:2 \; \
      select-layout -t ${name} tiled &>/dev/null
  fi
  ${tmate_cmd} -f ${HOME}/.tmux.conf -F -S /tmp/${name}.sock attach-session -t ${name}
}

compctl -/ -S '' -W "(${SOURCE_DIR} ${muxable_paths[*]})" mate
compctl -/ -S '' -W "(${SOURCE_DIR} ${muxable_paths[*]})" mux

