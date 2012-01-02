all: pathogen init_links

init_links:
	bash init.sh

pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
