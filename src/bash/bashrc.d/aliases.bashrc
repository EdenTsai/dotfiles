#!/usr/bin/env bash
# vim: set filetype=sh

# Change directory quickly.
alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd-="cd -"

# Shorten commands.
alias c="clear"
alias cls="clear"
alias d="dir"
alias f="finger"
alias h="history"
alias l="last"
alias lo="logout"
alias um="unmount"
alias s="screen"
alias so="source"
alias t="telnet"
alias cps="composer"
alias gc="gcloud"
alias gcc="gcloud compute"
alias kc="kubectl"

# Grep
alias grep="grep --color=auto --directories=skip --exclude=\.swp --exclude=\.svn --exclude=\.git"
alias egrep="egrep --color=auto --directories=skip --exclude=\.swp --exclude=\.svn --exclude=\.git"
alias fgrep="fgrep --color=auto --directories=skip --exclude=\.swp --exclude=\.svn --exclude=\.git"

# List directory contents with colorized output.
#   -G        | Enable colorized output.
#   -F        | Display a slash ('/') immediately after each pathname that is a directory,
#             | an asterisk ('*') after each that is executable,
#             | an at sign ('@') after each symbolic link,
#             | an equals sign ('=') after each socket,
#             | a percent sign ('%') after each whiteout,
#             | and a vertical bar ('|') after each that is a FIFO.
#   -d        | Directories are listed as plain files (not searched recursively).
#   -1        | Force output to be one entry per line.
#   -A        | Include directory entries whose names begin with a dot ('.').
#   -l        | List files in the long format.
#   -D format | When printing in the long (-l) format, use format to format the date and time output.
os=`uname -s`
if [ "Darwin" == "$os" ] && [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
    # For coreutils installed...
    os="Linux"
fi

case "$os" in
    "FreeBSD" | "Darwin")
        alias ls="ls -GF"
        alias l.="ls -GF -d .*"                 # List hidden files only.
        alias l1="ls -GF1"                      # Force output to be one entry per line.
        alias la="ls -GFA"                      # List all files.
        alias ll="ls -GFl -D '%Y-%m-%d %T'"     # List files in the long format.
        alias lla="ls -GFlA -D '%Y-%m-%d %T'"   # List all files in the long format.
        ;;
    "Linux")
        alias ls="ls --color=auto -F"
        alias l.="ls -F -d .*"                 # List hidden files only.
        alias l1="ls -F1"                      # Force output to be one entry per line.
        alias la="ls -FA"                      # List all files.
        alias ll="ls -Fl --time-style=+'%Y-%m-%d %T'"     # List files in the long format.
        alias lla="ls -FlA --time-style=+'%Y-%m-%d %T'"   # List all files in the long format.
        ;;
esac

# Be careful with copy files.
#   -i | Cause cp to write a prompt to the standard error output befor copying a file
#      | that would overwrite an existing file.
alias copy="cp -i"

# Be careful with move and rename files.
#   -i | Cause mv to write a prompt to standard error before moving a file
#      | that would overwrite an existing file.
alias move="mv -i"

# Be careful with remove files
#   -i | Request confirmation before attempting to remove each file.
alias remove="rm -i"

# Create parent directories on demand.
#   -p | Create intermediate directories as required.
#   -v | Be verbose when creating directories, listing them as they are created.
alias mkdir="mkdir -pv"
alias md="mkdir -pv"

# Display free disk space with Human-readable output.
#   -h | 'Human-readable' output.
alias df="df -h"

# Display disk usage statistics with Human-readable output.
#   -c | Display a grand total.
#   -h | 'Human-readable' output.
alias du='du -ch'

# Make mount command output pretty and human readable format
alias mount="mount | column -t"
alias m="mount"

# List jobs with more information.
alias jobs="jobs -l"
alias j="jobs -l"

# Do not verify the peer certificate against trusted CAs.
alias fetch="fetch --no-verify-peer"

# Start calculator with math support.
#   -l, --mathlib | Allow specification of an arbitrary precision math library.
alias bc="bc --mathlib"

# Colorize the tree command output.
alias tree="tree -CFl --dirsfirst"

# Tmux force to assume the terminal supports 256 colours.
alias tmux="tmux -2"

# Continue getting a partially-downloaded file.
alias wget="wget -c"

# Forces OpenSSH client to use IPv4 addresses only.
#   -4             | Force to use IPv4 addresses only.
#   -6             | Force to use IPv6 addresses only.
#   -C             | Request compression of all data.
#   -e escape_char | Sets the escape character for sessions with a pty (default: '~'),
#                  | Setting the character to “none” disables any escapes and makes the session fully transparent .
#   -v             | Enables verbose mode.
alias ssh="ssh -4 -C -e none"

# PHPUnit always use colors in output.
alias phpunit="phpunit --colors"

# Quickly go back to a specific parent directory
alias bd=". bd -s"

# icdiff always display line numbers.
alias icdiff="icdiff --line-numbers"

# Display information about my top cpu processes
alias topme="top -U $USER"

# httping always use colors.
alias httping="httping --colors"

# Display process status with more information.
#   -u | Display more information
#   -a | Display information about other users' processes as well as your own.
#   -x | include processes which do not have a controlling terminal.
alias psu="ps -u"
alias psmem='ps -aux | sort -nr -k 4'
alias psmem10='psmem | head -n 10'
alias pscpu='ps -aux | sort -nr -k 3'
alias pscpu10='pscpu | head -n 10'

# List $PATH and force output to be one entry per line
alias path="echo -e \${PATH//:/\\\n}"

# List $MANPATH and force output to be one entry per line
alias manpath="echo -e \${MANPATH//:/\\\n}"

# Display today's date.
alias today="date '+%Y-%m-%d %T'"

# Vim open last edited file.
alias vimlast="vim -c \"normal '0\""

# Open Vim faster without plugins
alias vimfast="vim --noplugin"

# The ping command do not wait interval 1 second, go fast
#   -c count      | Stop after sending (and receiving) count ECHO_RESPONSE packets.
#   -s packetsize | Specify the number of data bytes to be sent.
alias fastping='ping -c 100 -s.2'

# Tig Reflog
alias tig-reflog="git reflog --pretty=raw | tig --pretty=raw"