if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Java 17 (for SonarLint and other tools)
fish_add_path /opt/homebrew/bin
fish_add_path --prepend --move /usr/local/bin
fish_add_path /opt/homebrew/opt/openjdk@17/bin
fish_add_path /Users/ayctor/.local/bin
fish_add_path "/Users/ayctor/Library/Application Support/Herd/config/nvm"
fish_add_path "/Users/ayctor/Library/Application Support/Herd/bin"
fish_add_path /Users/ayctor/.cargo/bin
fish_add_path /Users/ayctor/.composer/vendor/bin

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/ayctor/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/ayctor/Library/Application Support/Herd/config/php/83/"

# # Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/ayctor/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/ayctor/Library/Application Support/Herd/config/php/81/"

set -xg EDITOR nvim
set -g CDPATH . ~ ~/.config ~/Code

# Added by codebase-memory-mcp install
export PATH="/Users/ayctor/.local/bin:$PATH"
