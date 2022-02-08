-- map buffer local keybindings when the language server attaches
local servers = {
	'bashls',
	'clangd',
	'golangci_lint_ls',
	'gopls',
	'jdtls',
	'jsonls',
	'sumneko_lua',
}

local nvim_lsp = require('lspconfig')

local cfg = {}
require "lsp_signature".setup(cfg)


for _, lsp in ipairs(servers) do
	-- local server_available, requested_server = lsp_installer_servers.get_server(lsp)
	-- if server_available then
	-- 	requested_server:on_ready(function ()
	-- 		local opts = {}
	-- 		requested_server:setup(opts)
	-- 	end)
	-- 	if not requested_server:is_installed() then
	-- 		-- Queue the server to be installed
	-- 		requested_server:install()
	-- 	end
	-- end


	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local settings = {}
	if lsp == 'sumneko_lua' then
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim', 'use'},
				},
			}
		}
	end
	nvim_lsp[lsp].setup {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = settings,
	}
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
