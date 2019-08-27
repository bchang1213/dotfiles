" FZF (Fuzzy Finder) Config
" add fzf to runtime path
set rtp+=/usr/local/opt/fzf

" map :files command to control + p
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>

" Uses ripgrep in fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

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

" Persistens undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . undoDir)
    let &undodir = undoDir
    set undofile
endif

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

" Press space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" move lines http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" make backspace behave normally
" https://stackoverflow.com/questions/18777705/vim-whats-the-default-backspace-behavior
set backspace=indent,eol,start
set redrawtime=10000

" fix netrw mt, mf, mc
let g:netrw_keepdir=0

" <C-j> & <C-k> to move up and down the complete popup list
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-j>      pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k>      pumvisible() ? "\<C-p>" : "\<Up>"

" set relative numbers and line numbers in netrw viewer
" https://vi.stackexchange.com/questions/3372/how-do-i-setnumber-and-relativenumber-for-explore-in-vimrc
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'

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
set hlsearch
filetype plugin indent on
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
