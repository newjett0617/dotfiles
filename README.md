# dotfiles

## get start
```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

## usage
```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
```

## setup in new computer
```bash
git clone --bare https://github.com/newjett0617/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```
