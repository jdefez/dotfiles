# ------------------------------------------------------------------------------
# general aliases
# ------------------------------------------------------------------------------

abbr -a -- cat bat

# ------------------------------------------------------------------------------
# Git aliases
# ------------------------------------------------------------------------------

abbr -a --position anywhere --command git -- co checkout
abbr -a --position anywhere --command git -- st status
abbr -a --position anywhere --command git -- pu push

# ------------------------------------------------------------------------------
# Nvim aliases
# ------------------------------------------------------------------------------

abbr -a -- nv nvim
abbr -a -- vi nvim

# ------------------------------------------------------------------------------
# Php aliases
# ------------------------------------------------------------------------------

abbr -a -- psa ./vendor/bin/phpstan
abbr -a -- rec ./vendor/bin/rector
abbr -a -- pst ./vendor/bin/pest
abbr -a -- pi ./vendor/bin/pint

abbr -a -- cmp composer
abbr -a --position anywhere --command composer -- up update
abbr -a --position anywhere --command composer -- in install
