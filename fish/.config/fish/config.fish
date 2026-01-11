
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -xg EDITOR nvim

# User paths
set -gx fish_user_paths \
    /home/jean/.local/bin \
    /home/jean/.claude \
    /home/jean/.cargo/bin \
    /usr/bin

fzf --fish | source

set -g CDPATH . ~ ~/.config ~/Code
