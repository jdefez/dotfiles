if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Java 17 (for SonarLint and other tools)
fish_add_path /opt/homebrew/opt/openjdk@17/bin

set -xg EDITOR nvim
set -g CDPATH . ~ ~/.config ~/Code
