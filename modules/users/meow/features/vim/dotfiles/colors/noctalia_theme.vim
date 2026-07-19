set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='noctalia_theme'

" custom syntax groups
syn match Braces          '[{}()\[\]]'
syn match FuncCall        '\zs\w*\ze('
syn match PyDecorator     '@'                  display contained
syn match PyDecoratorName '@\s*\h\%(\w\|\.\)*' display contains=PyDecorator

" base color settings
" without `exe`, we can't pass variables
exe 'hi ColorColumn'
                             \ 'guibg={{colors.surface_variant.default.hex}}'
exe 'hi Comment'               'guifg={{colors.comment_source.default.hex}}'
exe 'hi Constant'              'guifg={{colors.constant_source.default.hex}}'
exe 'hi CurSearch'             'guifg={{colors.search_curr_fg_source.default.hex}}'
                             \ 'guibg={{colors.search_curr_bg_source.default.hex}}'
exe 'hi CursorLine'
                             \ 'guibg={{colors.surface_variant.default.hex}}'        'cterm=none'
exe 'hi CursorLineNr'          'guifg={{colors.terminal_normal_yellow.default.hex}}' 'cterm=none'
exe 'hi Define'                'guifg={{colors.keyword_source.default.hex}}'
exe 'hi Error'                 'guifg={{colors.error_source.default.hex}}'
                             \ 'guibg=NONE'                                          'cterm=none'
exe 'hi Identifier'            'guifg={{colors.function_source.default.hex}}'
exe 'hi Include'               'guifg={{colors.keyword_source.default.hex}}'
exe 'hi IncSearch'             'guifg={{colors.search_curr_fg_source.default.hex}}'
                             \ 'guibg={{colors.search_curr_bg_source.default.hex}}'  'cterm=none'
exe 'hi LineNr'                'guifg={{colors.keyword_source.default.hex}}'
exe 'hi Macro'                 'guifg={{colors.keyword_source.default.hex}}'
exe 'hi markdownBold'          'guifg={{colors.keyword_source.default.hex}}'
exe 'hi markdownCode'          'guifg={{colors.pink_light_source.default.hex}}'
exe 'hi markdownItalic'        'guifg={{colors.keyword_source.default.hex}}'
exe 'hi markdownRule'          'guifg={{colors.comment_source.default.hex}}'
exe 'hi MatchParen'            'guifg={{colors.matching_paren_fg_source.default.hex}}'
                             \ 'guibg={{colors.matching_paren_bg_source.default.hex}}'
exe 'hi NonText'               'guifg={{colors.default_fg_source.default.hex}}'
exe 'hi Normal'                'guifg={{colors.default_fg_source.default.hex}}'
exe 'hi Operator'              'guifg={{colors.default_fg_source.default.hex}}'
exe 'hi Pmenu'
                             \ 'guibg={{colors.surface_variant.default.hex}}'
exe 'hi Pmenusel'              'guifg={{colors.hover_fg_source.default.hex}}'
                             \ 'guibg={{colors.hover_bg_source.default.hex}}'
exe 'hi PreCondit'             'guifg={{colors.keyword_source.default.hex}}'
exe 'hi PreProc'               'guifg={{colors.function_source.default.hex}}'
exe 'hi PyDecorator'           'guifg={{colors.keyword_source.default.hex}}'
exe 'hi rstHyperlinkReference' 'guifg={{colors.link_source.default.hex}}'
exe 'hi Search'                'guifg={{colors.search_fg_source.default.hex}}'
                             \ 'guibg={{colors.search_bg_source.default.hex}}'
exe 'hi Special'               'guifg={{colors.constant_source.default.hex}}'
exe 'hi Statement'             'guifg={{colors.keyword_source.default.hex}}'
exe 'hi StatusLine'            'guifg={{colors.accent_3_fg_source.default.hex}}'
                             \ 'guibg={{colors.accent_3_bg_source.default.hex}}'
exe 'hi StatusLineNC'          'guifg={{colors.accent_4_fg_source.default.hex}}'
                             \ 'guibg={{colors.accent_4_bg_source.default.hex}}'
exe 'hi Title'                 'guifg={{colors.accent_2_fg_source.default.hex}}'
exe 'hi Todo'                  'guifg={{colors.warning_source.default.hex}}'
exe 'hi Type'                  'guifg={{colors.keyword_source.default.hex}}'
exe 'hi Underlined'            'guifg={{colors.constant_source.default.hex}}'
exe 'hi vimCommentTitle'       'guifg={{colors.comment_source.default.hex}}'
exe 'hi Visual'                'guifg={{colors.selection_fg_source.default.hex}}'
                             \ 'guibg={{colors.selection_bg_source.default.hex}}'

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
