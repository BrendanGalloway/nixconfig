# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH="$PATH:$HOME/go/bin:$HOME/.bin:${KREW_ROOT:-$HOME/.krew}/bin"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

source $HOME/.kube-ps1.git/kube-ps1.sh
export KUBE_PS1_SYMBOL_ENABLE=false

export PS1="\[\e[34m\]\u@\h $(kube_ps1)\[\e[36m\]\w\[\e[94m\]\$(parse_git_branch)\[\e[00m\]$ "


#kubectx and kubens
export PATH=~/.kubectx:$PATH
complete -C /home/brendan/.bin/kustomize kustomize

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/brendan/.gcloud/path.bash.inc' ]; then . '/home/brendan/.gcloud/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/brendan/.gcloud/completion.bash.inc' ]; then . '/home/brendan/.gcloud/completion.bash.inc'; fi

# krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export EDITOR=/usr/bin/vim

complete -C /usr/local/bin/mc mc
source <(kubectl completion bash)
