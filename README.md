# How to keep your plugins in git

Based on http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/



## Install pathogen

	mkdir -p ~/.vim/autoload ~/.vim/bundle 
	curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim


## Installing your Vim environment

	git clone http://github.com/rstuven/dotvim.git .rstuven-dotvim
	cd dotvim
	git submodule update --init

### Linux:
	ln -s ~/.rstuven-dotvim/vimrc ~/.vimrc

### Windows:
	mklink /h "./vimrc" "%USERPROFILE%/_vimrc"
	mklink /h "./gvimrc" "%USERPROFILE%/_gvimrc"



## Install plugins as submodules

	cd bundle
	git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
	git add .
	git commit -m "Install Fugitive.vim bundle as a submodule."



## Upgrading a plugin bundle

	cd bundle/fugitive
	git pull origin master



## Upgrading all bundled plugins

	git submodule foreach git pull origin master
