# ------------------------------------------------------------------------------
# Abbreviations
# 
# Abbreviations are shortcuts for commands. You can also use them to
# expand commands. Abbreviations can be expanded with the <tab> key.
#
# Abbreviations are defined in the ~/.config/fish/conf.d/abbr.fish file.
# You can add abbreviations there or define them in the ~/.config/fish/config.fish
# file.
#
# Abbreviations are expanded in the following order:
# 1. Aliases
# 2. Functions
# 3. Commands
# 4. Variables
#
# Abbreviations can be defined in any order. The order of the expansions
# is not important.
#
# For more information, see:
# https://fishshell.com/docs/current/cmds/abbr.html

abbr -a -- cat bat
abbr -a -- ll lsd --tree --depth=1
abbr -a -- ls ls -lah

# ------------------------------------------------------------------------------
# git aliases
# ------------------------------------------------------------------------------

abbr -a --position anywhere --command git -- co checkout
abbr -a --position anywhere --command git -- st status
abbr -a --position anywhere --command git -- pu push

# ------------------------------------------------------------------------------
# nvim aliases
# ------------------------------------------------------------------------------

abbr -a -- nv nvim
abbr -a -- vi nvim

# ------------------------------------------------------------------------------
# php aliases
# ------------------------------------------------------------------------------

abbr -a -- psa ./vendor/bin/phpstan
abbr -a -- rec ./vendor/bin/rector
abbr -a -- pst ./vendor/bin/pest
abbr -a -- pi ./vendor/bin/pint

abbr -a -- cmp composer
abbr -a --position anywhere --command composer -- up update
abbr -a --position anywhere --command composer -- in install
