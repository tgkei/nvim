call plug#begin('~/.config/nvim/autoload/plugged')

  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Themes
  Plug 'morhetz/gruvbox'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Git
  " Plug 'mhinz/vim-signify'
  " Plug 'tpope/vim-fugitive'
  " Plug 'tpope/vim-rhubarb'
  " Plug 'junegunn/gv.vim'
  " Terminal
  " Plug 'voldikss/vim-floaterm'
  " Start Screen
  " Plug 'mhinz/vim-startify'
  " Which key
  Plug 'liuchengxu/vim-which-key'

call plug#end()
