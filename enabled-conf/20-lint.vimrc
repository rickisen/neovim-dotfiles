" You can import a linter and modify its properties. An example:
"
" local phpcs = require('lint').linters.phpcs
" phpcs.args = {
"   '-q',
"   -- <- Add a new parameter here
"   '--report=json',
"   '-'
" }
" Some linters are defined as function for lazy evaluation of some properties. In this case, you need to wrap them like this:
"
" local original = require("lint").linters.terraform_validate
" require("lint").linters.terraform_validate = function()
"   local linter = original()
"   linter.cmd = "my_custom"
"   return linter
" end
" You can also post-process the diagnostics produced by a linter by wrapping it. For example, to change the severity of all diagnostics created by cspell:
"
" local lint = require("lint")
" lint.linters.cspell = require("lint.util").wrap(lint.linters.cspell, function(diagnostic)
"   diagnostic.severity = vim.diagnostic.severity.HINT
"   return diagnostic
" end)
"

au BufWritePost * lua require('lint').try_lint()

lua << EOF

-- vim.diagnostic.config({
--   severity_sort = true,
--   severity = { min = vim.diagnostic.severity.ERROR }  -- show only ERROR and above
-- })

local lint = require('lint')

lint.linters_by_ft = {
  sql = {'sqlfluff'},
}

local sqlfluff = require('lint').linters.sqlfluff
sqlfluff.args = { "lint", "--format=json", "--dialect=postgres" }


local util = require("lint.util")

lint.linters.sqlfluff = util.wrap(lint.linters.sqlfluff, function(diagnostic)
  -- sqlfluff uses string severities in its JSON output; lint already mapped some to numbers.
  -- Keep only ERROR-level diagnostics; drop everything else.
  if diagnostic.severity == vim.diagnostic.severity.ERROR or diagnostic.severity == 1 then
    return diagnostic
  end
  return nil
end)

EOF
