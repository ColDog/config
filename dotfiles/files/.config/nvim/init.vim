" vim:fdm=marker et ft=vim sts=2 sw=2 ts=2
scriptencoding utf-8


call plug#begin()
" Auto-close parens / quotes, requires no config
Plug 'cohama/lexima.vim'
" Shared project settings
Plug 'editorconfig/editorconfig-vim'
" Fuzzy finder
Plug 'junegunn/fzf.vim'
" Autosave.
Plug '907th/vim-auto-save'
" Themes.
Plug 'chriskempson/base16-vim'
Plug 'dikiaap/minimalist'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'w0ng/vim-hybrid'
Plug 'kaicataldo/material.vim'
" Javascript syntax highlighting.
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
" Nerdtree tree view
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Makes tabbing better
Plug 'ervandew/supertab'
" Airline status line
Plug 'vim-airline/vim-airline'
" Coc vim for highlighting and code completion:
function! CocSetup(info)
  " Initial setup
  call coc#util#install()
  " Update/install extensions
  :CocInstall coc-css coc-emoji coc-highlight coc-html coc-json coc-prettier
        \ coc-pyls coc-stylelint coc-tslint coc-tsserver coc-ultisnips coc-yaml
endfunction
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': function('CocSetup')}
call plug#end()

" Required for operations modifying multiple buffers.
set hidden

" Note: These do not work with `noremap`
nmap <leader>lc <Plug>(coc-references)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>ls <Plug>(coc-documentSymbols)
nmap <leader>lt <Plug>(coc-type-definition)

" Enable auto save.
let g:auto_save = 1

" Themeing.
let g:material_terminal_italics = 1
let g:material_theme_style = 'dark'
set termguicolors
set background=dark
syntax on
colorscheme material

" Nerdtree on ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
