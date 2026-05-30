set relativenumber          " Relative line numbers
set showmode                " Already off in Lua (showmode=false)
set cursorline              " Highlight the current line
set signcolumn=yes          " Always show sign column
set title                   " Set terminal window title
set titlestring=\ %t        " Title shows just the filename
 
set scrolloff=10            " Keep 10 lines above/below cursor
set breakindent             " Wrapped lines continue visually indented
set undofile                " Persistent undo history

set ignorecase              " Case-insensitive search...
set smartcase               " ...unless query has uppercase letters

"set inccommand=split        " NOTE: Neovim-only; ignored by classic Vim

 
set updatetime=250          " Faster CursorHold / swap write (ms)
set timeoutlen=300          " Faster which-key / mapped sequence timeout (ms)
 
