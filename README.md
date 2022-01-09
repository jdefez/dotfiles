found @: https://www.atlassian.com/git/tutorials/dotfiles

# set up
```bash
# create a .dotfiles directory
git init --bare $HOME/.dotfiles

# create an alias config which we will use instead of the regular git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# set a flag - local to the repository - to hide files we are not explicitly tracking yet
config config --local status.showUntrackedFiles no

# add the alias definition to your .zshrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

# sample usages

``` bash
config remote add origin git@github.com:jdefez/dotfiles.git

config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

# Install your dotfiles onto a new system

```bash
# add the config alias to the zshrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# avoiding weird git recursions
echo ".dotfiles" >> .gitignore

# clone the repository
git clone --bare git@github.com:jdefez/dotfiles.git $HOME/.dotfiles

# Define the alias in the current shell
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# [!] that may fail
config checkout

# backup blocking files in a directory (if you care)
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

# checkout again
config checkout

# Set the flag showUntrackedFiles to no on this specific (local) repository
config config --local status.showUntrackedFiles no

# Enjoy!
```
