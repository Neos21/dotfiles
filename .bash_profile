# ================================================================================
# .bash_profile
# ================================================================================


# Detect OS And Settings
# ================================================================================

if [ "$(uname)" == 'Darwin' ]; then
  # echo '[MacOS] .bash_profile'
  # ==============================================================================
  
  # Nodebrew
  PATH="${HOME}/.nodebrew/current/bin:${PATH}"
  
  # VSCode
  PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
  
  # PostgreSQL
  PATH="/Library/PostgreSQL/11/bin:${PATH}"
  
  # RBEnv
  eval "$(rbenv init - 2> /dev/null)"
  
  # Python3
  PATH="/usr/local/opt/python/libexec/bin:${PATH}"
  
  # OCI CLI Tab Completion
  test -r "${HOME}/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" && . "${HOME}/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"
  
  # Rust
  PATH="${HOME}/.cargo/bin:${PATH}"
  
  # Go
  export GOPATH="${HOME}/go"
  PATH="${GOPATH}/bin:${PATH}"
  
  # Java
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
  export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'
  PATH="${JAVA_HOME}/bin:${PATH}"
  
  # Maven
  export M2_HOME='/usr/local/apache-maven-3.5.3'
  PATH="$M2_HOME/bin:${PATH}"
  
  # Homebrew PATH
  PATH="/usr/local/bin:${PATH}"
  
  # Customize --------------------------------------------------------------------
  
  
  # ------------------------------------------------------------------------------
else
  # echo '[Windows] .bash_profile'
  # ==============================================================================
  
  # WinPTY
  alias node='winpty node.exe'
  alias docker='winpty docker'
  alias python='winpty python'
  
  # Customize --------------------------------------------------------------------
  
  
  # ------------------------------------------------------------------------------
fi


# History
# ================================================================================

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '


# Git Completion
# ================================================================================

# test -r "${HOME}/.git-completion.bash" &&
. "${HOME}/.git-completion.bash"

# My Aliases
# if type __git_complete 1>/dev/null 2>/dev/null; then
  # Branch
  __git_complete gbd _git_branch
  # Checkout
  __git_complete gco _git_checkout
  # Diff
  __git_complete gdf _git_diff
  __git_complete gdfc _git_diff
  __git_complete gdfn _git_diff
  __git_complete gdfnc _git_diff
  __git_complete gdfw _git_diff
  __git_complete gdfwc _git_diff
  __git_complete gdfwo _git_diff
  __git_complete gdfwoc _git_diff
  # Merge
  __git_complete gm _git_merge
# fi

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE='true'
export GIT_PS1_SHOWUNTRACKEDFILES='true'


# My Commands : Export PATH
# ================================================================================

export PATH="${HOME}/bin:${PATH}"


# Source .bashrc
# ================================================================================

# test -r "${HOME}/.bashrc" &&
. "${HOME}/.bashrc"


# --------------------------------------------------------------------------------
# Customize
# --------------------------------------------------------------------------------


# --------------------------------------------------------------------------------
