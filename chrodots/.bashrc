#
# ~/.bashrc
#

# Expand history buffer
HISTSIZE=5000
HISTFILESIZE=10000

# Append history
shopt -s histappend

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/rem/.local/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#Prompt edit
#export PS1=" \u | \w | [\t]>"
# 
#\u - user name
#\h - short hostname
#\W - current working dir
#\? - exit status of the command
#export PS1="\[\e[1;33m\]\u\[\e[m\]\[\e[36m\]:\w\[\e[m\][\[\e[1;30m\]\t\[\e[m\]]\[\e[1;33m\]\$\[\e[m\] "
export PS1="\[\e[1;35m\]\u\[\e[m\]\[\e[33m\]:\w\[\e[m\][\[\e[34m\]\t\[\e[m\]]\[\e[1;35m\]\$\[\e[m\] "
#XServer nonsense
export DISPLAY=:0.0
#set CTX to 1 to open in first position
export CUR_CTX='1'
#most
export PAGER='most'
export MANPAGER='most'
#VIM all the things
export EDITOR='vim'
export VISUAL='vim'
#nnn plugins
export NNN_PLUG='2:dups;c:chksum;d:diffs;f:fzcd;h:hexview;i:imgview;o:fzopen;p:preview-tui;t:treeview;u:uidgid;x:x2sel;z:fzz'
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#npm nonsense
export PATH=~/.npm-global/bin:$PATH
#fetch!
neofetch

#Start ssh-agent and ensure only one process runs at a time
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#	ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi

#if ps -p $SSH_AGENT_PID > /dev/null
#then
#   :
   # Do something knowing the pid exists, i.e. the process with $PID is running
#else
#eval `ssh-agent -s`
#fi


#launch Xorg
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# pwd generator
genpass() {
	local l=$1
       	[ "$l" == "" ] && l=20
	tr -dc A-Za-z0-9@\#\!\$%^\&*\+_ < /dev/urandom | head -c ${l} | xargs
}

# browser-sync config
# Get the current local IP address
export SERVER_IP=`hostname -i`

#########
# ALIAS #
#########
    alias diff='colordiff'
    alias ls='ls --color=auto'
    #vimify less
    alias vless='/usr/share/vim/vim82/macros/less.sh'
    #copy to clipboard
    alias clippy='xclip -sel clip'
    #gotop vice
    #alias gotop='gotop -c monokai'
    #ssh to skill challenge
    alias skills='ssh skill_challenge'
    #view running services
    alias services='systemctl --type=service'
    #tmux restore panes
    alias restore='tmuxp load ~/.tmuxp/main.yaml'
    #grep colors
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    ## Colorize the ls output ##
    alias ls='ls --color=auto'
    #list all TCP/UDP port
    alias ports='netstat -tulanp'
	#nnn fanciness
	#alias nnn='nnn -ac'	
	#better cat (syntax highlighting)
	#alias cat='bat -pp'
	#syntax highlighting for tailed logs
	#alias blog='bat --paging=never -l log'
    #additional controls for file mgmt
	alias mv='mv -iv'
	alias cp='cp -riv'
	alias mkdir='mkdir -vp'
    #neofetch clear
    alias neofetch='clear; neofetch'
    alias lucas='telnet towel.blinkenlights.nl'
    alias tmux='tmux -u'

# tmux launcher 
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	    restore
fi

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


#source /usr/share/doc/fzf/examples/key-bindings.bash
#source /usr/share/bash-completion/completion.bash
#source /usr/share/fzf/completion.bash
#source /usr/share/fzf/key-bindings.bash


export LIBGL_ALWAYS_INDIRECT=1
#. /home/rem/.zjump/z.sh
