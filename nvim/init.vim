set mouse+=a                 " Enable mouse
set selection=exclusive
set tabstop=2               "
set shiftwidth=2            "
set expandtab
set listchars=tab:\¦\       " Tab charactor
set list
"set foldmethod=syntax       "
"set foldnestmax=1
"set foldlevelstart=0        "
set number                  " Show line number
set relativenumber          " Show relative numbering
set ignorecase              " Enable case-sensitive

" Specify the path to the `rg` binary
let g:rg_command = '/home/u/hieutringuyen/bin/rg'

" Use `fzf` as an interactive search launcher with the alternative binary
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_command.' --column --line-number --no-heading --color=always --smart-case --follow '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)


" " Use `fzf` as an interactive search launcher with the alternative binary
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   g:rg_command.' --column --line-number --no-heading --color=always --smart-case --follow '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)',


" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize
set synmaxcol=200
set lazyredraw
" au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamedplus
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize pane
nmap <M-Right> :vertical resize +3<CR>
nmap <M-Left> :vertical resize -3<CR>
nmap <M-Down> :resize +3<CR>
nmap <M-Up> :resize -3<CR>

" Better window navigation ctrl+h,j,k,l instead of ctrl+w+h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Working with FZF ripgrep (copy->open Rg->paste copied text)
nnoremap <Leader>F yiw:Rg <CR> '<M-v>
"nnoremap <Leader>F yiw:Rg <CR>:let @/ = '<C-R>"'<CR>
"nnoremap <Leader>F yiw:Rg <CR>:execute "normal! i\<C-r>+"


" Working with NERDTree
" press `m` to call menu @ cursor position to (add,delete file)
nnoremap <silent><F2> :NERDTreeFind<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>

" GoTo code navigation, super cool to work with source code
" go to definition for example go to the function where it is exported to use
"nmap <silent>gd <Plug>(coc-definition)
" back to previous location. Very useful when using gd then <C-o> to go back
nnoremap <silent>gh <C-o>
" go to next location in history
nnoremap <silent>gl <C-i>
"nmap <silent>gy <Plug>(coc-type-definition)
"nmap <silent>gi <Plug>(coc-implementation)
" Go to references where that function being used in the source code
"nmap <silent>gr <Plug>(coc-references)
"nmap <silent><F12> <Plug>(coc-definition)

" Map <leader> to <space>
let mapleader=' '
"map redo ctrl + r
nnoremap U <C-R>

" close buffer. Consider to active this due to it will close buffer
nnoremap <silent><leader>bd :bd<cr>
" close window when split window
" nnoremap <silent><leader>q :close<cr>
" EXIT vim
nnoremap <silent><leader>q :q!<cr>
" Open list of Files History
nnoremap <silent><leader>i :History<CR>
" Open list of Commands History
nnoremap <silent><leader>Y :History:<CR>
" Open list of Search History
nnoremap <silent><leader>y :History/<CR>
" Open search by 'key word etc: class name, #id, function name...' entire current folder
nnoremap <silent><leader>g :Rg<CR>
" Open Files
nnoremap <silent><leader>f :GFiles<CR>
nnoremap <silent><leader>lf :Files<CR>
" Open Buffer
nnoremap <silent><leader>B :Buffers<CR>

" Open buffer list
" nnoremap <silent><leader>a 1Ag<CR>
" nnoremap <silent>ng :Ag<CR>
" map % to jum faster better open and close of {, [, (
nnoremap <silent><leader>j %
vnoremap <silent><leader>j %


" highlight selected word
nnoremap <silent>ff *

" unhighlight the matches
nnoremap <silent><leader>n :nohlsearch<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
nnoremap <C-l> <C-w>l
" (used with Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"call plug#begin(stdpath('config') . '/plugged')
" Theme
  Plug 'joshdick/onedark.vim',                  " Dark theme
  Plug 'dracula/vim',
" File browser
  Plug 'preservim/nerdTree'                     " File browser
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'tiagofumo'
          \ .'/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file

" File search
  Plug 'junegunn/fzf',
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
"  Plug 'neoclide/coc.nvim',
"    \ {'branch': 'release'}                     " Language server protocol (LSP)
"  Plug 'pappasam/coc-jedi',                     " Jedi language server
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdcommenter'                " Comment code
  Plug 'liuchengxu/vista.vim'                   " Function tag bar
  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag

" Code syntax highlight
  Plug 'yuezk/vim-js'                           " Javascript
  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  Plug 'uiiaoo/java-syntax.vim'                 " Java

" Debugging
"  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control
  Plug 'tpope/vim-fugitive'                     " Git infomation
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'                 " Git show changes
  Plug 'samoshkin/vim-mergetool'                " Git merge

  " Coding style
  Plug 'vivien/vim-linux-coding-style'          " Linux coding style

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme
" colorscheme onedark
" colorscheme dracula
" Overwrite some color highlight
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor

