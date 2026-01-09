if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Java 17 (for SonarLint and other tools)
fish_add_path /opt/homebrew/opt/openjdk@17/bin
fish_add_path /usr/local/bin/nvim-macos-x86_64/bin
fish_add_path /usr/local/bin/nvim
fish_add_path /Users/ayctor/.local/bin
fish_add_path "/Users/ayctor/Library/Application Support/Herd/config/nvm"
fish_add_path "/Users/ayctor/Library/Application Support/Herd/bin"
fish_add_path /Users/ayctor/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Users/ayctor/.composer/vendor/bin
fish_add_path /usr/local/bin

set -xg EDITOR nvim
set -g CDPATH . ~ ~/.config ~/Code
