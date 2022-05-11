local lspconfig = require('lspconfig')
local lsp_installer = require "nvim-lsp-installer"

-- map buffer local keybindings when the language server attaches
local servers = {
	'bashls',			-- bash
	'clangd',			-- c/c++
	'cmake',			-- cmake
	'golangci_lint_ls', -- golanglint
	'gopls',			-- golang
	'html',				-- html
	'jsonls',			-- json
	'rust_analyzer',	-- rust
	'sqls',				-- sql
	'sumneko_lua',		-- lua
	'tsserver',			-- typescript
	'yamlls',			-- yaml
	'zk',				-- markdown
	'jdtls',			-- java
	-- 'texlab',
}

-- lsp_install
lsp_installer.on_server_ready(function(server)
	local opts = {}
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

for _, lsp_name in ipairs(servers) do
	local server_is_found, server = lsp_installer.get_server(lsp_name)
	if server_is_found and not server:is_installed() then
		print("LSP Installing " .. lsp_name)
		server:install()
	end
end

-- lspconfig
for _, lsp_name in ipairs(servers) do
	local settings = {}
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	if lsp_name == 'sumneko_lua' then
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim', 'use'},
				},
			}
		}
	end
	lspconfig[lsp_name].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = settings,
	}
end


-- lsp signature
require "lsp_signature".setup()

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
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
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

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })
--
