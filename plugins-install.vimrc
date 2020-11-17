call plug#begin('~/.config/nvim/plugged')

" sensible vim
Plug 'tpope/vim-sensible'

" (LSP) Multi-entry selection UI.
Plug 'junegunn/fzf'

" (LSP) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" (LSP) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" syntax package
Plug 'sheerun/vim-polyglot'

" asynchronous execution library for Vim, others depends on this
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" search for files, maybe dep of nerdtree
Plug 'shougo/unite.vim'

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" colorizer
Plug 'lilydjwg/colorizer'

" colorschemes
" Plug 'whatyouhide/vim-gotham'
Plug 'rickisen/vim-gotham'

" Gundo
Plug 'sjl/gundo.vim'

" Match tag allways
Plug 'Valloric/MatchTagAlways'

" NERDtree
Plug 'scrooloose/nerdtree'

" NERDtree git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Targets ( 'ci(', 'ca{', etc)
Plug 'wellle/targets.vim'

" Ultisnips
Plug 'SirVer/ultisnips'

" vim snippets
Plug 'honza/vim-snippets'

" airline
Plug 'vim-airline/vim-airline'

" vim-exchange
Plug 'tommcdo/vim-exchange'

" Fugitive
Plug 'tpope/vim-fugitive'

" vim-surround
Plug 'tpope/vim-surround'

" adds fi after if in bash (and other similair things)
Plug 'tpope/vim-endwise'

" tcomments
Plug 'tomtom/tcomment_vim'

" neomake (like dispatch and syntastic)
Plug 'benekastah/neomake'

" highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" increment bools too
Plug 'can3p/incbool.vim'

" smart indetation when pasting code
Plug 'sickill/vim-pasta'

" split and join various objects on multiple lines
Plug 'AndrewRadev/splitjoin.vim'

" enhanced golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" calculate stuff
Plug 'arecarn/vim-crunch'

" vim godot-gameengine
" Plug 'quabug/vim-gdscript'
Plug 'calviken/vim-gdscript3'

" for moving around inside indent level
Plug 'michaeljsmith/vim-indent-object'

" make the preview window float next to completions
Plug 'ncm2/float-preview.nvim'

" react / jsx
" Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'othree/yajs'
" Plug 'mxw/vim-jsx' "included in polyglot
Plug 'jordwalke/JSDocSnippets'

" for jsx/tsx highlighting
Plug 'leafgarland/typescript-vim'

" Plug 'peitalin/vim-jsx-typescript'
Plug 'ianks/vim-tsx'

" to apply prettier on typescript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" vim-react-snippets
Plug 'justinj/vim-react-snippets'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" auto completion lite
Plug 'lifepillar/vim-mucomplete'

" auto pairs like
" Plug 'jiangmiao/auto-pairs'
Plug 'tmsvg/pear-tree'
" Plug 'Raimondi/delimitMate'

call plug#end()
" Plugin Configuration ==================================================

