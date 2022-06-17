#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTHOME/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

fpath=(
  /opt/homebrew/share/zsh/site-functions
  /usr/local/share/zsh/site-functions
  $fpath
)
