require('plugins')

-- theme
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[
colorscheme gruvbox
command! -bang -nargs=* Rg call fzf#vim#grep('rg --no-heading --line-number --color=always --smart-case -g "!kitex_gen/" -- '.shellescape(<q-args>), 1,  fzf#vim#with_preview(), <bang>0)
]])



require('basic')

require('keybindings')

require('plugs-config/bufferline')
require('plugs-config/nvim-treesitter')
require('plugs-config/nvim-tree')
require('plugs-config/gitsigns')
require('plugs-config/indent')
require('plugs-config/trouble')
require('plugs-config/whichkey')
require('plugs-config/xall')
require('lsp/lsp')

