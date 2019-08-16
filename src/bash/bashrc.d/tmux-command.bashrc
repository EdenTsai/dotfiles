#!/usr/bin/env bash
# vim: set filetype=sh

# Bashrc configuration for `tmux` command.
bashrc::configure_tmux_command()
{
    # Tmux force to assume the terminal supports 256 colours.
    alias tmux="tmux -2"

    # tmux stores the server socket in a directory under TMUX_TMPDIR or /tmp if it is unset
    local readonly hostname=$(hostname)
    export TMUX_TMPDIR="${HOME}/.tmux/tmp/${hostname}"
    if ! test -d "${TMUX_TMPDIR}"; then
        mkdir -v -p "${TMUX_TMPDIR}"
    fi

    # FIXME Confirm this is avaiable
    # https://github.com/tmux-plugins/tmux-resurrect
    export TMUX_RESURRECT_DIR_CATEGORY="${hostname}"
}

bashrc::configure_tmux_command