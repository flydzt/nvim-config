vim.opt.expandtab = false
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
-- map('n', '<leader>rg', ':w<CR>:!goimports -w -local code,git %<CR>', opt)
map('n', '<leader>rg', ':w<CR>:!~/goimports_help.sh %<CR>', opt)
map('n', '<leader>rt', ':w<CR>:!gomodifytags -file % -struct <cword> -add-tags json -add-options json=omitempty --skip-unexported --quiet -w<CR>', opt)
