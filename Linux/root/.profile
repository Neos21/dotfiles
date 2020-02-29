# --------------------------------------------------------------------------------
# .profile : Root Config
# --------------------------------------------------------------------------------


# Ubuntu 18.04 Original .profile
# ================================================================================

# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true


# General
# ================================================================================

# Neo's Dotfiles
if [ -d '/home/neo/' ]; then
  # Copy Neo's Dotfiles
  test -r /root/.git-completion.bash || cp /home/neo/.git-completion.bash /root/
  test -r /root/.git-prompt.sh       || cp /home/neo/.git-prompt.sh       /root/
  test -r /root/.gitconfig           || cp /home/neo/.gitconfig           /root/
  test -r /root/.inputrc             || cp /home/neo/.inputrc             /root/
  test -r /root/.npmrc               || cp /home/neo/.npmrc               /root/
  test -r /root/.tigrc               || cp /home/neo/.tigrc               /root/
  test -r /root/.tmux.conf           || cp /home/neo/.tmux.conf           /root/
  test -r /root/.vimrc               || cp /home/neo/.vimrc               /root/
  test -d /root/.vim                 || cp -r /home/neo/.vim              /root/
  
  # Source Neo's Dotfiles
  test -r /home/neo/.bash_profile && . /home/neo/.bash_profile
  test -r /home/neo/.bashrc       && . /home/neo/.bashrc
fi

# Red Prompt
export PS1='\n\[\033[31m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[0m\]\n$ '
