local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	-- plugin manager
	use 'wbthomason/packer.nvim'
	-- find
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'junegunn/fzf', run = function()
		vim.fn['fzf#install']()
	end}
	use {'junegunn/fzf.vim'}
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'rafamadriz/friendly-snippets'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'ray-x/lsp_signature.nvim'
	-- file manager
	use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', },}
	-- tab manager
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	-- git
	use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},}
	use 'tpope/vim-fugitive'
	-- preview
	use 'iamcco/markdown-preview.nvim'
	use {
		'xuhdev/vim-latex-live-preview',
		config = function ()
			vim.g.livepreview_engine='xelatex'
			vim.g.livepreview_previewer='mupdf'
		end
	}

	-- better default
	use {"folke/which-key.nvim"}
	use 'folke/lsp-colors.nvim'
	use 'yamatsum/nvim-cursorline'
	use {'kevinhwang91/nvim-bqf', ft = 'qf'}
	use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",}
	use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons",}
	use 'junegunn/vim-peekaboo'
	use 'mg979/vim-visual-multi'
	use 'tpope/vim-surround'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'voldikss/vim-floaterm'
	use 'voldikss/vim-translator'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'jiangmiao/auto-pairs'
	use {
		'phaazon/hop.nvim',
		branch = 'v1', -- optional but strongly recommended
		config = function()
			require'hop'.setup()
		end
	}
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	-- theme
	use 'shaunsingh/nord.nvim'
	use 'rakr/vim-one'
	use 'morhetz/gruvbox'
	use 'NLKNguyen/papercolor-theme'
	-- auto sync
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
