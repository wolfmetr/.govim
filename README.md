# Vim configuration

My vim configuration for go


## Requirements

* vim 7.3.885+ with Lua (see more in https://github.com/Shougo/neocomplete.vim )
* Exuberant ctags - `sudo apt-get install exuberant-ctags` or `brew install ctags-exuberant` for Mac OS X


##Instalation
Install lastest vim with Lua. For Mac OS X:
```
brew install vim --with-lua --override-system-vim
```

Install lastest Ack if you want:
```
brew install ack
```

Clone this repository in your home dir:

```
git clone git@github.com:wolfmetr/.govim.git ~/.govim
```

Set evironment variable
```
export VIM_DIR=~/.govim
```

Create ``~/.vimrc`` file with content:

```
source ~/.govim/rc.vim
```

Install plugins: ``vim +PlugInstall``

