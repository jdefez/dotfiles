
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -xg EDITOR nvim

fzf --fish | source

set -g CDPATH . ~ ~/.config ~/Code

abbr -a -- cat bat

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
