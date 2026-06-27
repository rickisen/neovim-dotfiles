autocmd FileType go :Coverage

lua << EOF
require("coverage").setup()
EOF
