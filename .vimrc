" set the clipboard to system clipboard
set clipboard=unnamed

" FZF (Fuzzy Finder) Config
" add fzf to runtime path
set rtp+=/usr/local/opt/fzf
" map :files command to control + p
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
" map the leader (back slash) key with b and h
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
" use :e filename and :w to create and write files
:set autochdir
" Save the file with control+w
nnoremap <C-w> :w<CR>
" Select all with ctrl+a
map <C-a> <esc>ggVG<CR>
" Set tab and shift-tab to mimic standard indentation behavior
vmap <Tab> >gv
vmap <S-Tab> <gv
" Makes j & k to also move on wrapped lines, but still retains function when
" using motions
" https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Enable all functions of Emmet in all modes.
let g:user_emmet_mode='a'

" Turn on the vim editor syntax highlighting
syntax on
set expandtab
set shiftwidth=4
set softtabstop=4
set ruler
set number relativenumber
set autoread
set ignorecase
set smartcase
set bs=2
" sets ejs as html
au BufNewFile,BufRead *.ejs set filetype=html

" lightline config **********************************************************************************
" Automatically open & close quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow

" modifying lightline statusline color
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
"establish ColorScheme Theme for lightline
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline
" ***************************************************************************************************
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
