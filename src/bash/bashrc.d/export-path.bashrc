#!/usr/bin/env bash
# vim: set filetype=sh
#
# The 'PATH' environment variable.
#

unshift_paths_to_global "/bin"
unshift_paths_to_global "/sbin"
unshift_paths_to_global "/usr/bin"
unshift_paths_to_global "/usr/sbin"
unshift_paths_to_global "/usr/games"
unshift_paths_to_global "/usr/local/bin"
unshift_paths_to_global "/usr/local/sbin"

# Added gem paths
local gempath=$(gem environment gempath)
for gemdir in $(echo -e ${gempath//:/\\\n} | sort -r); do
    unshift_paths_to_global "$gemdir/bin"
done;

unshift_paths_to_global "$HOME/bin"
unshift_paths_to_global "$HOME/.bin"
unshift_paths_to_global "$HOME/.composer/vendor/bin"
unshift_paths_to_global "$HOME/.local/bin"
unshift_paths_to_global "$HOME/.npm_packages/bin"
unshift_paths_to_global "$HOME/.bash/submodules/fzf/bin"
unshift_paths_to_global "$HOME/Library/Python/2.7/bin"
unshift_paths_to_global "$HOME/opt/tig/bin"