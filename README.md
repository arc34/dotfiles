# ARC's dotfiles

## Installation

1. Clone this repository to your $HOME folder
```bash
git clone https://github.com/arc34/dotfiles.git ~/.dotfiles
```
2. Add the following alias in your ~/.bashrc
```bash
alias dgit="git --git-dir ~/.dotfiles/.git --work-tree=$HOME"
```
2. Switch to a specific project branch
```bash
cd ~/
dgit checkout <project branch>
```
3. In $HOME folder, execute the following
```bash
dgit reset --hard
```

## Notes

Performing the above commands will replace the contents of 
following files/directory.
- .bashrc
- .vimrc
- .tmux.conf
- .vim (directory)
- .tmux (directory)
- .script (directory)
