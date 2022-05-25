-- global options
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.backup = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.diffopt = "internal,filler,vertical"
vim.opt.display = "lastline,msgsep"
vim.opt.equalalways = true
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱' + 'fold: '
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.joinspaces = false
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.modelines = 0
vim.opt.mouse = "a"
vim.opt.path = vim.opt.path + "**/*"
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.shortmess = "filnxtToOFc"
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.updatetime = 1000
vim.opt.visualbell = false
vim.opt.wildmode = "full"
vim.opt.writebackup = false

-- window local
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true
vim.opt.foldcolumn = 'auto:3'
vim.opt.foldmarker = "{{{,}}}"
vim.opt.foldmethod = "marker" -- {{{ }}}
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- spellings
vim.opt.spelllang = 'en_us'
vim.opt.spellsuggest = 'best'

-- buffer local
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.fixendofline = false
vim.opt.formatoptions = "cqnjlr"
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.modelines = 5
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.undofile = true

