local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- file manager
map('n', '<leader><leader><leader>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opt)

-- terminal
map('n', '<leader><leader>t', ':w<CR>:FloatermToggle<CR>', opt)

-- jump
map('n', '<leader><leader>l', ':HopLine<CR>', opt)
map('n', '<leader><leader>w', ':HopWord<CR>', opt)
map('n', '<leader><leader>c', ':HopChar1<CR>', opt)

-- find
map('n', '<leader>fa', ':Telescope builtin<CR>',opt)
map('n', '<leader>ff', ':Telescope find_files<CR>',opt)
map('n', '<leader>fl', '<cmd>lua require("telescope.builtin").live_grep{ search_dirs={"%:p"} }<cr>', opt)
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', opt)
map('n', '<leader>fb', ':Telescope buffers<CR>', opt)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opt)
map('n', '<leader>fc', ':Telescope commands<CR>', opt)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opt)
-- map('n', '<leader>fg', ':Rg<CR>', opt)

-- lsp
map('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gd', ':Trouble lsp_definitions<CR>', opt)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
map('n', 'gi', ':Trouble lsp_implementations<CR>', opt)
map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
map('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
map('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
map('n', 'gr', ':Trouble lsp_references<CR>', opt)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
map('n', '<leader><leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opt)

-- error
map('n', '<leader>ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
map('n', '<leader>ek', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
map('n', '<leader>ej', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
map('n', '<leader>el', ':TroubleToggle document_diagnostics<CR>', opt)
map('n', '<leader>ea', ':TroubleToggle workspace_diagnostics<CR>', opt)
-- map('n', '<leader>el', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)

-- refactor
map('n', '<leader>rf', ':w<CR><cmd>lua vim.lsp.buf.formatting()<CR>', opt)
-- map('n', '<leader>rg', ':w<CR>:!goimports -w -local code,git %<CR>', opt)
map('n', '<leader>rg', ':w<CR>:!~/goimports_help.sh %<CR>', opt)
map('n', '<leader>rt', ':w<CR>:!gomodifytags -file % -struct <cword> -add-tags json -add-options json=omitempty --skip-unexported --quiet -w<CR>', opt)

-- buffer
map('n', '<leader>bd', ':bd<CR>', opt)
map('n', '<leader>bw', ':bw<CR>', opt)
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)

-- translate
map('n', '<leader>t', ':TranslateW<CR>', opt)
map('v', '<leader>t', ':TranslateW<CR>', opt)

-- git
map('n', '<leader>gg', ':LazyGit<CR>', opt)
map('n', '<leader>gs', ':Git status<CR>', opt)
map('n', '<leader>ga', ':Git add .<CR>', opt)
map('n', '<leader>gc', ':Git commit -a<CR>', opt)
map('n', '<leader>gb', ':Git blame<CR>', opt)
map('n', '<leader>gd', ':Git diff<CR>', opt)
map('n', '<leader>gf', ':Git fetch<CR>', opt)
map('n', '<leader>gp', ':Git push<CR>', opt)
map('n', '<leader>gl', ':Git log<CR>', opt)

-- gitsigns
-- Navigation
map('n', ']c', ':Gitsigns next_hunk<CR>', opt)
map('n', '[c', ':Gitsigns prev_hunk<CR>', opt)
-- Actions
map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opt)
map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', opt)
map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opt)
map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', opt)
map('n', '<leader>hS', ':Gitsigns stage_buffer<CR>', opt)
map('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', opt)
map('n', '<leader>hR', ':Gitsigns reset_buffer<CR>', opt)
map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', opt)
map('n', '<leader>hb', ':lua require"gitsigns".blame_line{full=true}<CR>', opt)
map('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', opt)
map('n', '<leader>hd', ':Gitsigns diffthis<CR>', opt)
map('n', '<leader>hD', ':lua require"gitsigns".diffthis("~")<CR>', opt)
map('n', '<leader>td', ':Gitsigns toggle_deleted<CR>', opt)
-- Text object
map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opt)
map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opt)
