# ARC's dotfiles

## Installation

1. Clone this repository to your $HOME folder
    ```bash
    $ git clone --recursive https://github.com/arc34/dotfiles.git ~/.dotfiles
    ```
2. Add the following at the top of your ~/.bashrc
    ```bash
    # Source my dotfiles pre-setup alias
    if [ -f ~/.bash_predot ]; then
        . .bash_predot
    fi
    ```
3. Add the following at the bottom of your ~/.bashrc
    ```bash
    # Source my dotfiles
    if [ -f ~/.bash_postdot ]; then
        . .bash_postdot
    fi
    ```
4. Copy *.bash_predot* in your HOME directory
    ```bash
    $ cp ~/.dotfiles/.bash_predot ~/
    ```
5. Switch to a specific project branch (optional)
    ```bash
    $ cd ~/
    $ dgit checkout <project branch>
    ```
6. In $HOME folder, execute the following
    ```bash
    $ dgit reset --hard
    ```

## Notes

Performing the above commands will replace the contents of
following files/directory.
- .vimrc
- .tmux.conf
- .vim (directory)
- .tmux (directory)
- .script (directory)

