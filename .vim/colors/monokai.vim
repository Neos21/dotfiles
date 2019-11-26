" ====================================================================================================
" monokai.vim
" ====================================================================================================


" 全般
" ====================================================================================================

hi clear

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "monokai"


" 色設定
" ====================================================================================================

hi Normal          ctermfg=231   ctermbg=16                     guifg=#ffffff  guibg=#000000               
hi Comment         ctermfg=245                                  guifg=#8a8a8a                              
hi CursorLine                    ctermbg=233   cterm=none                      guibg=#121212               
hi CursorLineNr    ctermfg=208                 cterm=none       guifg=#fd971f                 gui=none     
hi CursorColumn                  ctermbg=236                                   guibg=#293739               
hi ColorColumn                   ctermbg=236                                   guibg=#232526               
hi LineNr          ctermfg=250   ctermbg=236                    guifg=#465457  guibg=#232526               
hi NonText         ctermfg=59                                   guifg=#465457                              
hi SpecialKey      ctermfg=59                                   guifg=#465457                 gui=none     
hi Character       ctermfg=144                                  guifg=#e6db74                              
hi Boolean         ctermfg=135                                  guifg=#ae81ff                              
hi Number          ctermfg=135                                  guifg=#ae81ff                              
hi String          ctermfg=227                                  guifg=#ffff5f                              
hi Conditional     ctermfg=161                 cterm=bold       guifg=#f92672                 gui=bold     
hi Constant        ctermfg=135                 cterm=bold       guifg=#ae81ff                 gui=bold     
hi Cursor          ctermfg=16    ctermbg=253                    guifg=#000000  guibg=#f8f8f0               
hi iCursor                                                      guifg=#000000  guibg=#f8f8f0               
hi Debug           ctermfg=225                 cterm=bold       guifg=#bca3a3                 gui=bold     
hi Define          ctermfg=81                                   guifg=#66d9ef                              
hi Delimiter       ctermfg=241                                  guifg=#8f8f8f                              
hi DiffAdd                       ctermbg=24                                    guibg=#13354a               
hi DiffChange      ctermfg=181   ctermbg=239                    guifg=#89807d  guibg=#4c4745               
hi DiffDelete      ctermfg=162   ctermbg=53                     guifg=#960050  guibg=#1e0010               
hi DiffText                      ctermbg=102   cterm=bold                      guibg=#4c4745  gui=bold     
hi Directory       ctermfg=118                 cterm=bold       guifg=#a6e22e                 gui=bold     
hi Error           ctermfg=219   ctermbg=89                     guifg=#e6db74  guibg=#1e0010               
hi ErrorMsg        ctermfg=199   ctermbg=16    cterm=bold       guifg=#f92672  guibg=#232526  gui=bold     
hi Exception       ctermfg=118                 cterm=bold       guifg=#a6e22e                 gui=bold     
hi Float           ctermfg=135                                  guifg=#ae81ff                              
hi FoldColumn      ctermfg=67    ctermbg=16                     guifg=#465457  guibg=#000000               
hi Folded          ctermfg=67    ctermbg=16                     guifg=#465457  guibg=#000000               
hi Function        ctermfg=118                                  guifg=#a6e22e                              
hi Identifier      ctermfg=81                                   guifg=#66d9ef                              
hi Ignore          ctermfg=244   ctermbg=232                    guifg=#808080  guibg=bg                    
hi IncSearch       ctermfg=193   ctermbg=16                     guifg=#c4be89  guibg=#000000               
hi Keyword         ctermfg=161                 cterm=bold       guifg=#f92672                 gui=bold     
hi Label           ctermfg=229                 cterm=none       guifg=#e6db74                 gui=none     
hi Macro           ctermfg=193                                  guifg=#c4be89                 gui=none     
hi MatchParen      ctermfg=233   ctermbg=208   cterm=bold       guifg=#000000  guibg=#fd971f  gui=bold     
hi ModeMsg         ctermfg=229                                  guifg=#e6db74                              
hi MoreMsg         ctermfg=229                                  guifg=#e6db74                              
hi Operator        ctermfg=161                                  guifg=#f92672                              
hi Pmenu           ctermfg=81    ctermbg=16                     guifg=#66d9ef  guibg=#000000               
hi PmenuSel        ctermfg=255   ctermbg=242                                   guibg=#808080               
hi PmenuSbar                     ctermbg=232                                   guibg=#080808               
hi PmenuThumb      ctermfg=81                                   guifg=#66d9ef                              
hi PreCondit       ctermfg=118                 cterm=bold       guifg=#a6e22e                 gui=bold     
hi PreProc         ctermfg=118                                  guifg=#a6e22e                              
hi Question        ctermfg=81                                   guifg=#66d9ef                              
hi Repeat          ctermfg=161                 cterm=bold       guifg=#f92672                 gui=bold     
hi Search          ctermfg=0     ctermbg=222   cterm=none       guifg=#000000  guibg=#ffe792               
hi SignColumn      ctermfg=118   ctermbg=235                    guifg=#a6e22e  guibg=#232526               
hi SpecialChar     ctermfg=161                 cterm=bold       guifg=#f92672                 gui=bold     
hi SpecialComment  ctermfg=245                 cterm=bold       guifg=#7e8e91                 gui=bold     
hi Special         ctermfg=81                                   guifg=#66d9ef  guibg=bg       gui=none     
hi Statement       ctermfg=161                 cterm=bold       guifg=#f92672                 gui=bold     
hi StatusLine      ctermfg=238   ctermbg=253                    guifg=#455354  guibg=fg                    
hi StatusLineNC    ctermfg=244   ctermbg=232                    guifg=#808080  guibg=#080808               
hi StorageClass    ctermfg=208                                  guifg=#fd971f                 gui=none     
hi Structure       ctermfg=81                                   guifg=#66d9ef                              
hi Tag             ctermfg=161                                  guifg=#f92672                 gui=none     
hi Title           ctermfg=166                                  guifg=#ef5939                              
hi Todo            ctermfg=231   ctermbg=232   cterm=bold       guifg=#ffffff  guibg=bg       gui=bold     
hi Typedef         ctermfg=81                                   guifg=#66d9ef                              
hi Type            ctermfg=81                  cterm=none       guifg=#66d9ef                 gui=none     
hi Underlined      ctermfg=244                 cterm=underline  guifg=#808080                 gui=underline
hi VertSplit       ctermfg=244   ctermbg=232   cterm=bold       guifg=#808080  guibg=#080808  gui=bold     
hi VisualNOS                     ctermbg=238                                   guibg=#403d3d               
hi Visual                        ctermbg=227                                   guibg=#ffff5f               
hi WarningMsg      ctermfg=231   ctermbg=238   cterm=bold       guifg=#ffffff  guibg=#333333  gui=bold     
hi WildMenu        ctermfg=81    ctermbg=16                     guifg=#66d9ef  guibg=#000000               
hi TabLineFill                                                  guifg=#1b1d1e  guibg=#1b1d1e               
hi TabLine                                                      guifg=#808080  guibg=#1b1d1e  gui=none     
hi SpellBad                      ctermbg=52                     guifg=#ff0000                 gui=none     
hi SpellCap                      ctermbg=17                     guifg=#7070f0                 gui=none     
hi SpellLocal                    ctermbg=17                     guifg=#70f0f0                 gui=none     
hi SpellRare       ctermfg=none  ctermbg=none  cterm=none       guifg=#ffffff                 gui=none     


" For Windows VSCode Integrated Terminal
" ====================================================================================================

if &t_Co <= 8
  hi Normal          ctermfg=7           
  hi Comment         ctermfg=0           
  hi StatusLine      ctermfg=0  ctermbg=7
  hi LineNr          ctermfg=0           
  hi NonText         ctermfg=0           
  hi SpecialKey      ctermfg=0           
  hi CursorLineNr    ctermfg=1           
  hi Number          ctermfg=1           
  hi Function        ctermfg=2           
  hi PreProc         ctermfg=2           
  hi String          ctermfg=3           
  hi Conditional     ctermfg=5           
  hi Operator        ctermfg=5           
  hi Statement       ctermfg=5           
  hi Error           ctermfg=5           
  hi ErrorMsg        ctermfg=5           
  hi WarningMsg      ctermfg=5           
  hi Question        ctermfg=6           
  hi Identifier      ctermfg=6           
  hi Special         ctermfg=6           
endif


" 後処理
" ====================================================================================================

set background=dark
