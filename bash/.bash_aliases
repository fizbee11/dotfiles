# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias vi='nvim'
alias kc='kubectl'
alias dh='cd /home/$USER/dev/home'
alias dw='cd /home/$USER/dev/work'
alias dp='cd /home/$USER/dev/prof'

alias ap='ansible-playbook'
alias ag='ansible-galaxy'
alias fn='nvim $(fzf --preview="bat --color=always --theme=gruvbox-dark --style=numbers {}" --walker-skip .git,node_modules,target,.cache)'

alias bwlogin='export BW_SESSION=$(bw unlock --raw)'

alias update='sudo dnf upgrade --refresh && sudo snap refresh && sudo flatpak update'
alias sourcepython='source /opt/python/bin/activate'
alias sourcebench='source /home/$USER/dev/prof/bench/frappe-bench/env/bin/activate'

#   bw rbw
alias bwssh='rbw get "${BW_SSH_KEY_ID}" -f "private_key" | ssh-add -'
alias bwgit='rbw get "${BW_GIT_SSH_KEY_ID}" -f "private_key" | ssh-add -'
alias bwfb='rbw get "${BW_FB_SSH_KEY_ID}" -f "private_key" | ssh-add -'



#alias fc='fzf --preview 'bat --style=numbers --color=always {}'| xargs cd'

