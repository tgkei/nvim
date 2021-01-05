call plug#begin('~/.config/nvim/autoload/plugged')

  " Have the file system follow you around
  Plug 'airblade/vim-rooter'

  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{' 
  " Plug 'jiangmiao/auto-pairs'
  " Themes
  Plug 'morhetz/gruvbox'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Status Line
  " Plug 'ChristianChiarulli/eleline.vim'
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Git
  " Plug 'mhinz/vim-signify'
  " Plug 'tpope/vim-fugitive'
  " Plug 'tpope/vim-rhubarb'
  " Plug 'junegunn/gv.vim'
  " Terminal
  " Plug 'voldikss/vim-floaterm'
  " Start Screen
  " Plug 'mhinz/vim-startify'
  " Help
  Plug 'liuchengxu/vim-which-key'

call plug#end()
