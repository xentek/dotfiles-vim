set nocompatible 	  		" use VIM not vi

" Plugins
filetype off				" required for vundle
set rtp+=~/.vim/bundle/Vundle.vim       " vundle runtime path
call vundle#begin()			" all plugins must be between vundle begin/end
Plugin 'VundleVim/Vundle.vim'		" plugin manager
Plugin 'vim-scripts/L9'			" vim-script utility lib
Plugin 'bogado/file-line'		" open vim at the specified line, e.g. `vim file.rb:20`
Plugin 'scrooloose/nerdcommenter'	" block comments = ,c<space>
Plugin 'scrooloose/syntastic'		" syntax checker
Plugin 'vim-airline/vim-airline'	" status line
Plugin 'tpope/vim-surround'		" change ounding characters
Plugin 'vim-scripts/kwbdi.vim'		" delete buffers with :bd but don't close the window
Plugin 'AndrewRadev/switch.vim'		" easily switch stuff (quotes, hash key style, booleans, etc) with -
Plugin 'austintaylor/vim-indentobject'  " block indent helper
Plugin 'othree/vim-autocomplpop'	" autocomplete
Plugin 'airblade/vim-gitgutter'		" show git changes in left gutter
Plugin 'xolox/vim-misc'                 " required by easytags
Plugin 'xolox/vim-easytags'		" ctags support
Plugin 'majutsushi/tagbar'		" ctags browser
Plugin 'editorconfig/editorconfig-vim'  " editor config support
Plugin 'tpope/vim-projectionist'	" project configuration for :A, :AV, :AS, etc
Plugin 'sheerun/vim-polyglot'		" syntax and language support for all modern languages
Plugin 'ap/vim-css-color'		" css color highlighting
call vundle#end()			" end plugins

" Configuration
filetype plugin indent on 		" Enable filetype-specific indenting and plugins
set noshowmode                          " dont show mode in status bar
syntax on		  		" Syntax Highlighting
syntax sync fromstart                   " sync syntax
set background=dark	  		" Dark BG
colorscheme grb256	  		" Use IR_Black as theme
set nu			  		" Turn on line numbers
set autoindent				" auto-indent
set copyindent                          " use previous indention when autoindenting
set smartindent                         " do smart indenting when starting a new line
set shiftwidth=2                        " 2 space tabs
set softtabstop=2			" 2 space tabs
set expandtab                           " expand tabs to spaces
set shiftround                          " use multiples of shiftwidth when indenting blocks
set wildmode=list:longest		" tab completion for file paths
set clipboard=unnamed			" Integrate with System Keyboard
set nobackup                            " no backup files
set nowritebackup                       " no backup files while editing
set noswapfile                          " no swap files
set hid					" allow hiding of unsaved buffers
set ru					" show the 'ruler'
set vb					" visual bell
set noeb				" no bells
set tw=72                               " page width
"set colorcolumn=80                     " draw a line at column 80
set modeline                            " turn on modeline support
set modelines=5                         " check 5 lines for modelines in the file
set ls=2				" turn on status line
set statusline=%f\ %m\ %r               " status line tweaks
set statusline+=Line:\ %l/%L            " show line numbers: current/total
set statusline+=\ \|\ Col:\ %v          " show column number
set shell=/usr/local/bin/zsh            " Use zsh for shell commands
set textwidth=0 wrapmargin=0            " No automatic line breaks
set synmaxcol=1200                      " only syntax highlight the first 1200 chars of a line (speeds up vim)
set nojoinspaces                        " one space after .
set nostartofline                       " don't reset cursor to start of line when moving around
set autoread                            " reload buffers when file changes
set ttyfast                             " Improve VIM's scrolling speed
set ttyscroll=3                         " ttyscroll
set lazyredraw                          " lazyredraw
set splitright                          " open vertical splits on the right
set undofile                            " Save undo's after file closes
set undodir=~/.vim/undo                 " where to save undo histories
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
set backspace=indent,eol,start          " backspace through everything in insert mode
"set shortmess=a                        " get rid of press enter or type command alert
"set cmdheight=2                        " get rid of press enter or type command alert
"let g:bufferline_echo=0                " get rid of press enter or type command alert
set noshowmode                          " let airline do the work
let g:switch_mapping = "-"		        " set :Switch to -
" UTF-8
if has('multi_byte')
  scriptencoding utf-8
  set encoding=utf-8
end

" Key Mappings
let mapleader = ','                                    " leader
let maplocalleader = '\\'                              " localleader
vnoremap < <gv                                         " keep selection after indent
vnoremap > >gv                                         " keep selection after outdent

" Filetypes
au BufRead,BufNewFile Lobfile set filetype=ruby                         " Lobfiles should be treated as ruby
au BufRead,BufNewFile Thorfile set filetype=ruby                        " Thorfiles should be treated as ruby
au BufRead,BufNewFile *.thor   set filetype=ruby                        " Thorfiles should be treated as ruby
au BufRead,BufNewFile Gemfile set filetype=ruby                         " Gemfiles should be treated as ruby
au BufRead,BufNewFile Guardfile set filetype=ruby                       " Guardfiles should be treated as ruby
au BufRead,BufNewFile *.ru set filetype=ruby                            " Rackup Files should be treated as ruby
au BufRead,BufNewFile *.jeco set filetype=erb                           " eco templates should be treated as erb
au BufRead,BufNewFile *.eco set filetype=erb                            " eco templates should be treated as erb
au BufNewFile,BufReadPost *.coffee setl invlist shiftwidth=2 expandtab  " 2 space indents for coffeescript
au BufRead,BufNewFile aliases set filetype=sh                           " aliases file should be treated as shell scrip
au BufNewFile,BufRead *.ejs set filetype=erb                            " ejs should be treated as erb
au BufNewFile,BufRead *.jst set filetype=erb                            " ejs should be treated as erb
au BufNewFile,BufRead *.slim set filetype=slim                          " slim should be treated as slim
au BufRead,BufNewFile *.{md,txt} set filetype=markdown                  " Markdown files
au BufNewFile,BufRead *.json setf javascript                            " json should be treated as javascript
au FileType python set sts=4 ts=4 sw=4 tw=79                            " python files follow PEP8
au FileType {make,gitconfig} set noexpandtab sw=4                       " use real tabs for some files
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255         " Autocomplete ids and classes in CSS
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-              " Add the '-' as a keyword in erb files
autocmd Filetype gitcommit setlocal spell textwidth=72                  " lines longer than 72 chars is not allowed in git commits

" globbing
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem           " Disable output and VCS files
set wildignore+=*.gif,*.jpg,*.png,*.log                                       " Ignore images and log files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz                       " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*  " Ignore bundler and sass cache
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*  " Ignore rails temporary asset caches
set wildignore+=*/resources/*                                                 " Ignore custom folders
set wildignore+=node_modules/*                                                " Ignore node modules
set wildignore+=*.swp,*~,._*                                                  " Disable temp and backup files
set wildignore+=.DS_Store                                                     " Disable osx index files
set wildignore+=*/Godeps/*                                                    " Disable godeps vendor files

" syntastic config
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_slim_checkers=['slimrb']

" autocomplpopup config
let g:acp_behaviorKeywordLength = 3
let g:acp_behaviorKeywordIgnores = ["end"]

" go-vim config
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" python config
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=F403'

" php config
let g:syntastic_php_exec = '/usr/local/bin/php'
