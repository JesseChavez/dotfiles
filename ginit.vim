" neovim qt settings
" Guifont Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h11
" Guifont Inconsolata\ for\ Powerline:h11
" Guifont DejaVu\ Sans\ Mono:h10
" Guifont Hack:h11
" Guifont Inconsolata:h13
" Guifont Ubuntu\ Mono:h12
" Guifont Droid\ Sans\ Mono:h11

" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont Noto\ Mono:h11
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Fvim
if exists('g:fvim_loaded')
    set guifont=Noto\ Mono:h18
endif
