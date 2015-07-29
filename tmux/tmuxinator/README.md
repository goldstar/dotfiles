## Wat

Tmuxinator is a tool on top of tmux that lets you define your layouts and config in YAML.

`gem install tmuxinator`  (add sudo if using default system ruby)

Put the profiles found in this directory into `~/.tmuxinator`, then start with `tmuxinator start default` (to start the default profile).  I suggest replacing the alias `mux` with something like this:

`alias mux='tmuxinator start default'`

This will start a three pane layout in the current working directory.

### Help

Help modify these profiles to be generic and useful for the whole team.  Add new layouts you find useful as you work.
