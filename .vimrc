" Basic------------------------------------------------------------------------
set cindent
set cursorline
set encoding=utf-8
set expandtab
set incsearch
let mapleader = " "
set noswapfile
set number
set relativenumber
set shiftwidth=2
set smarttab
set tabstop=2
set title
set hidden 
set updatetime=300
set shortmess+=c
set signcolumn=yes
"------------------------------------------------------------------------------




" Cursorline-------------------------------------------------------------------
"augroup CustomCursorLine
"au!   
"    au ColorScheme * :hi! CursorLine 
"          \ gui=underline cterm=underline guibg=NONE ctermbg=NONE 
"    au VimEnter * setlocal cursorline
"    au WinEnter * setlocal cursorline
"    au BufWinEnter * setlocal cursorline
"    au WinLeave * setlocal nocursorline
"augroup END
" -----------------------------------------------------------------------------




" Plugins----------------------------------------------------------------------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ciaranm/inkpot'
Plug 'cormacrelf/vim-colors-github'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'fatih/vim-go'
Plug 'fugalh/desert.vim'
Plug 'google/vim-colorscheme-primary'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
Plug 'honza/vim-snippets'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'iamcco/markdown-preview.nvim', 
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'sickill/vim-monokai'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin',
      \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ryanoasis/vim-devicons' "This plugin must be loaded after nerdtree-git-plugin, or it will not be aligned well.
Plug 'wojciechkepka/bogster'

call plug#end()
"------------------------------------------------------------------------------




"Floaterm----------------------------------------------------------------------
let g:floaterm_keymap_new = '<Leader>c'
let g:floaterm_keymap_toggle = '<Leader>z'
let g:floaterm_keymap_kill = '<Leader>x'
let g:floaterm_keymap_prev = '<Leader>a'
let g:floaterm_keymap_next = '<Leader>s'
"------------------------------------------------------------------------------



" Airline----------------------------------------------------------------------
let g:airline_theme = 'powerlineish'
"let g:airline_theme = 'light'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
"------------------------------------------------------------------------------


" Nerdtree---------------------------------------------------------------------
nmap <C-n> :NERDTreeToggle<CR> <C-w>=
nmap <C-f> :NERDTreeFind<CR>
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden = 1
let g:NERDDefaultAlign = "left"
let g:NERDTreeWinSize = 50
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }                         


let g:NERDTreeIgnore = ['^node_modules$']
 "sync open file with NERDTree
 " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"------------------------------------------------------------------------------


" Undotree---------------------------------------------------------------------
if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
endif
"------------------------------------------------------------------------------



" Colorscheme------------------------------------------------------------------
set background=dark

"colorscheme bogster

"colorscheme solarized

"colorscheme inkpot

"colorscheme monokai

"colorscheme desert

"set termguicolors
"colorscheme nord


let g:gruvbox_bold=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_transparent_bg=1
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox

"let g:github_colors_soft = 1
"let g:github_colors_block_diffmark = 0
"colorscheme github

"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default.dark': {
"  "\       'transparent_background': 1,
"  \       'override' : {
"  \         'color00' : ['#080808', '232'],
"  \         'linenumber_bg' : ['#080808', '232']
"  \       },
"  \       'allow_bold' : 0
"  \     },
"  \     'default.light': {
"  \       'allow_bold' : 0,
"  \       'override' : {
"  \         'color00' : ['#ffffff', '15'],
"  \         'linenumber_bg' : ['#ffffff', '15']
"  \       },
"  "\        'transparent_background': 1
"  \     }
"  \   }
"  \ }
"colorscheme PaperColor

"set background=light
"syntax enable
"set t_Co=256
"colorscheme primary
highlight Normal ctermbg=NONE guibg=NONE
"------------------------------------------------------------------------------


" Ctrlp------------------------------------------------------------------------
let g:ctrlp_user_command = 
      \ ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"------------------------------------------------------------------------------



" cocconfig--------------------------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python'
  \ ]
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"------------------------------------------------------------------------------




" window-selector--------------------------------------------------------------
let i = 1
while i <= 9
    execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
"------------------------------------------------------------------------------





"keymap------------------------------------------------------------------------
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap <leader>t :TagbarToggle<CR>

autocmd BufWritePost * GitGutter
nnoremap <leader>pe :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>ps :Rg<space>

nmap <silent><leader>pe :e ~/.vimrc<CR>
nmap <expr> <leader>f 
      \ (index(['c','cpp', 'java', 'typescript', 'proto', 'javascript'], 
      \ &filetype) >= 0) ? 
      \ ':ClangFormat<CR>' : 
      \ ((index(['python', 'go', 'json', 'markdown', 
      \ 'vue', 'javascript.jsx', 'typescript.tsx', 'typescriptreact', 'javascriptreact', 'html', 'scss', 'css', 'yaml'],
      \ &filetype) >= 0) ? 
      \ ':Format<CR>' : '')


nnoremap <leader>u :UndotreeToggle<CR>
nnoremap gt :bn<CR>
nnoremap gT :bp<CR>
inoremap <silent><expr> <cr> pumvisible() ? 
      \ coc#_select_confirm() : 
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"------------------------------------------------------------------------------





" globalsettings---------------------------------------------------------------
let g:gitgutter_map_keys = 0
let g:go_template_autocreate=0
let g:jsx_ext_required = 1

set cc=80,100

hi SignColumn guibg=NONE ctermbg=NONE
hi LineNr ctermfg=NONE ctermbg=NONE
"hi ColorColumn ctermfg=NONE
hi CocErrorSign ctermbg=White
hi CocErrorSign ctermfg=DarkGreen
hi VertSplit ctermbg=NONE ctermfg=4
"------------------------------------------------------------------------------

" "Aliases" for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wa        wa<bang> <args>
command! -bar                                  -bang Wqall     wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar -nargs=* -complete=file          -bang Edit      edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
command! -bar                                  -bang Quit      quit<bang>
command! -bar                                  -bang Qall      qall<bang>
command! -bar -nargs=? -complete=option              Set       set <args>
command! -bar -nargs=? -complete=help                Help      help <args>
command! -bar -nargs=* -complete=file          -bang Make      make<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bdel      bdel<bang> <args>
command! -bar -nargs=* -complete=buffer        -bang Bwipe     bwipe<bang> <args>
command! -bar -nargs=* -complete=file          -bang Mksession mksession<bang> <args>
command! -bar -nargs=* -complete=dir           -bang Cd        cd<bang> <args>
command! -bar                                        Messages  messages
command! -bar -nargs=+ -complete=file          -bang Source    source<bang> <args>

