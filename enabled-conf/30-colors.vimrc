" enable nvim truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" call TextEnableCodeSnip(  'c',   '@begin=c@',   '@end=c@', 'SpecialComment')
" call TextEnableCodeSnip('cpp', '@begin=cpp@', '@end=cpp@', 'SpecialComment')
" call TextEnableCodeSnip('sql', '@begin=sql@', '@end=sql@', 'SpecialComment')
" call TextEnableCodeSnip('html' ,'#{{{html' ,'#html}}}', 'SpecialComment')
" function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
"   let ft=toupper(a:filetype)
"   let group='textGroup'.ft
"   if exists('b:current_syntax')
"     let s:current_syntax=b:current_syntax
"     " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
"     " do nothing if b:current_syntax is defined.
"     unlet b:current_syntax
"   endif
"   execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
"   try
"     execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
"   catch
"   endtry
"   if exists('s:current_syntax')
"     let b:current_syntax=s:current_syntax
"   else
"     unlet b:current_syntax
"   endif
"   execute 'syntax region textSnip'.ft.'
"   \ matchgroup='.a:textSnipHl.'
"   \ keepend
"   \ start="'.a:start.'" end="'.a:end.'"
"   \ contains=@'.group
" endfunction
"
" autocmd FileType sh call TextEnableCodeSnip('json' ,'#ft:json' ,'#ft:json-end', 'SpecialComment')

" :syntax on
" :syntax include @CPP syntax/cpp.vim
" :syntax region cppSnip matchgroup=Snip start="@begin=cpp@" end="@end=cpp@" contains=@CPP
" :hi link Snip SpecialComment

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all",
  ensure_installed = { "ada",
   "agda",
   "angular",
   "apex",
   "arduino",
   "asm",
   "astro",
   "authzed",
   "awk",
   "bash",
   "bass",
   "beancount",
   "bibtex",
   "bicep",
   "bitbake",
   "blueprint",
   "c",
   "c_sharp",
   "cairo",
   "capnp",
   "chatito",
   "clojure",
   "cmake",
   "comment",
   "commonlisp",
   "cooklang",
   "corn",
   "cpon",
   --"cpp",
   "css",
   "csv",
   "cuda",
   "cue",
   "d",
   "dart",
   "devicetree",
   "dhall",
   "diff",
   "disassembly",
   "dockerfile",
   "dot",
   "doxygen",
   "dtd",
   "ebnf",
   "eds",
   "eex",
   "elixir",
   "elm",
   "elsa",
   "elvish",
   "embedded_template",
   "erlang",
   "facility",
   "faust",
   "fennel",
   "fidl",
   "firrtl",
   "fish",
   "foam",
   "forth",
   "fortran",
   "fsh",
   "func",
   "fusion",
   -- "Godot",
   "gdshader",
   "git_config",
   "git_rebase",
   "gitattributes",
   "gitcommit",
   "gitignore",
   "gleam",
   -- "Glimmer",
   "glsl",
   --"GN",
   "gnuplot",
   "go",
   -- "Godot",
   "gomod",
   "gosum",
   "gotmpl",
   "gowork",
   "gpg",
   "graphql",
   "groovy",
   "gstlaunch",
   "hack",
   "hare",
   "haskell",
   "haskell_persistent",
   "hcl",
   "heex",
   "helm",
   "hjson",
   "hlsl",
   "hlsplaylist",
   "hocon",
   "hoon",
   "html",
   "htmldjango",
   "http",
   "hurl",
   "hyprlang",
   "ini",
   "ispc",
   "janet_simple",
   "java",
   "javascript",
   "jq",
   "jsdoc",
   "json",
   "json5",
   --"JSON",
   "jsonnet",
   "julia",
   "kconfig",
   "kdl",
   "kotlin",
   "kusto",
   "lalrpop",
   "latex",
   "ledger",
   "leo",
   "linkerscript",
   "liquidsoap",
   "llvm",
   "lua",
   "luadoc",
   "lua",
   "luau",
   "m68k",
   "make",
   "markdown",
   "markdown_inline",
   "matlab",
   "menhir",
   "mermaid",
   "meson",
   "mlir",
   "muttrc",
   "nasm",
   "nickel",
   "nim",
   "nim_format_string",
   "ninja",
   "nix",
   "norg",
   "nqc",
   "objc",
   "objdump",
   "ocaml",
   "ocaml_interface",
   "ocamllex",
   "odin",
   "org",
   "pascal",
   "passwd",
   "pem",
   "perl",
   "php",
   "php_only",
   "phpdoc",
   "pioasm",
   "po",
   "pod",
   --"Path",
   "pony",
   "printf",
   "prisma",
   "promql",
   "properties",
   "proto",
   "prql",
   "psv",
   "pug",
   "puppet",
   "purescript",
   --"PyPA",
   "python",
   "ql",
   "qmldir",
   "qmljs",
   --"Tree-Sitter",
   "r",
   "racket",
   "rasi",
   "rbs",
   "re2c",
   "readline",
   "regex",
   "rego",
   --"pip",
   "rnoweb",
   "robot",
   "ron",
   "rst",
   "ruby",
   "rust",
   "scala",
   "scfg",
   "scheme",
   "scss",
   "slang",
   "slint",
   "smali",
   "smithy",
   "snakemake",
   "solidity",
   "soql",
   "sosl",
   "sourcepawn",
   "sparql",
   "sql",
   "squirrel",
   "ssh_config",
   "starlark",
   "strace",
   "styled",
   "supercollider",
   "surface",
   "svelte",
   "swift",
   "sxhkdrc",
   "systemtap",
   "t32",
   "tablegen",
   "tcl",
   "teal",
   "templ",
   "terraform",
   "textproto",
   "thrift",
   "tiger",
   "tlaplus",
   "tmux",
   "todotxt",
   "toml",
   "tsv",
   "tsx",
   "turtle",
   "twig",
   "typescript",
   "typoscript",
   "typst",
   "udev",
   "ungrammar",
   "unison",
   "usd",
   --"uxn",
   "v",
   "vala",
   "verilog",
   "vhs",
   "vim",
   "vimdoc",
   "vue",
   "wgsl",
   "wgsl_bevy",
   "wing",
   "xcompose",
   "xml",
   "yaml",
   "yang",
   "yuck",
   "zathurarc",
   "zig"
  },

highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- additional_vim_regex_highlighting = false,
  },
 indent = {
   enable = true
 },
}
EOF

" set terminal color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Color scheme overrides
"
" \ | highlight Normal  cterm=NONE ctermbg=3  gui=NONE guibg=#1f1f1f
" \ | highlight Comment cterm=NONE ctermfg=14 gui=NONE guifg=#6272a4
" \ | highlight NonText cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
" augroup MyColors
" autocmd!
set termguicolors
autocmd ColorScheme * highlight Normal      guibg=NONE
                  \ | highlight EndOfBuffer guibg=NONE
                  \ | highlight NonText     guibg=NONE
                  \ | highlight NormalNC    guibg=NONE
                  \ | highlight CursorLine  guibg=#282a36
                  \ | highlight VertSplit   guibg=NONE    guifg=grey
                  " \ | highlight Comment   cterm=NONE ctermfg=14 gui=NONE guifg=#8f9ed3
augroup END

" set background=dark
" set background=light
colorscheme sonokai
