set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='anonymousrand'

" color variables
let black='#000000'
let blue_light='#80f4ff'
let blue='#00bfff'
let default='#cccccc'
let green='#a9ff40'
let orange='#ffd500'
let pink='#ff66b3'
let pink_light='#ffd1e8'
let pink_xlight='#ffe0f0'
let red='#ff0000'

" custom syntax groups
syn match Braces          '[{}()\[\]]'
syn match FuncCall        '\zs\w*\ze('
syn match PyDecorator     '@'                  display contained
syn match PyDecoratorName '@\s*\h\%(\w\|\.\)*' display contains=PyDecorator

" base color settings
" without `exe`, we can't pass variables
exe 'hi ColorColumn'                               'guibg=#181818'
exe 'hi Comment'               'guifg='.green
exe 'hi Constant'              'guifg='.blue_light
exe 'hi CursorLine'                                'guibg=#181818' 'cterm=none'
exe 'hi CursorLineNr'          'guifg='.orange                     'cterm=none'
exe 'hi Define'                'guifg='.pink_light
exe 'hi Error'                                     'guibg='.red
exe 'hi Identifier'            'guifg='.orange
exe 'hi Include'               'guifg='.pink_light
exe 'hi LineNr'                'guifg='.default
exe 'hi Macro'                 'guifg='.pink_light
exe 'hi markdownBold'          'guifg='.pink_light
exe 'hi markdownCode'          'guifg='.pink
exe 'hi markdownItalic'        'guifg='.pink_light
exe 'hi markdownRule'          'guifg='.green
exe 'hi MatchParen'                                'guibg=#666666'
exe 'hi NonText'               'guifg='.default
exe 'hi Normal'                'guifg='.default
exe 'hi Operator'              'guifg='.default
exe 'hi Pmenu'                                     'guibg=#252525'
exe 'hi Pmenusel'              'guifg='.orange     'guibg=#484848'
exe 'hi PreCondit'             'guifg='.pink_light
exe 'hi PreProc'               'guifg='.orange
exe 'hi PyDecorator'           'guifg='.pink_light
exe 'hi rstHyperlinkReference' 'guifg='.blue
exe 'hi Search'                'guifg='.black      'guibg='.green
exe 'hi Special'               'guifg='.blue_light
exe 'hi Statement'             'guifg='.pink_light
exe 'hi StatusLine'            'guifg='.pink_xlight
exe 'hi Title'                 'guifg='.green
exe 'hi Todo'                  'guifg='.green      'guibg='.red
exe 'hi Type'                  'guifg='.pink_light
exe 'hi Underlined'            'guifg='.blue_light
exe 'hi vimCommentTitle'       'guifg='.green
exe 'hi Visual'                'guifg='.black      'guibg='.pink_light

" linked color settings
hi link Braces                                 Normal
hi link FuncCall                               Function
hi link htmlTagName                            htmlTag
hi link htmlEndTag                             htmlTag
hi link htmlTagN                               htmlTag
hi link LineNrAbove                            LineNr
hi link LineBrBelow                            LineNr
hi link markdownBoldDelimiter                  MarkdownBold
hi link markdownCodeDelimiter                  MarkdownCode
hi link markdownHeadingDelimiter               Title
hi link markdownItalicDelimiter                MarkdownItalic
hi link PyDecoratorName                        PyDecorator
hi link rstDelimiter                           rstExplicitMarkup
hi link rstInterpretedTextOrHyperlinkReference markdownCode
hi link rstLiteralBlock                        markdownCode
