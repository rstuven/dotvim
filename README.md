# How to keep your plugins in git

Based on http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

## Installing your Vim environment

	cd ~
	git clone git@github.com:rstuven/dotvim.git .rstuven-dotvim
	cd .rstuven-dotvim
	git submodule update --init

### Linux:
	ln -s ~/.rstuven-dotvim ~/.vim
	ln -s ~/.rstuven-dotvim/vimrc ~/.vimrc

### Windows:
	mklink /h "./vimrc" "%USERPROFILE%/_vimrc"
	mklink /h "./gvimrc" "%USERPROFILE%/_gvimrc"



## Install plugins as submodules

	cd ~/.rstuven-dotvim
	git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
	git add .
	git commit -m "Installed Fugitive.vim bundle as a submodule."



## Upgrading a plugin bundle

	cd bundle/fugitive
	git pull origin master



## Upgrading all bundled plugins

	git submodule foreach git pull origin master
