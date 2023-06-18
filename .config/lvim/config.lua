--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "onedark"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.shell = "/bin/sh"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-q>"] = ":BufferKill<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<leader>c")
-- override a default keymapping
lvim.keys.normal_mode["<leader>a"] = ":CodeActionMenu<CR>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.normal_mode["<leader>e"] = ":NeoTreeRevealToggle<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["c"] = {
	name = "Conflict",
	o = { "<cmd>GitConflictChooseOurs<cr>", "Choose Ours" },
	t = { "<cmd>GitConflictChooseTheirs<cr>", "Choose Theirs" },
	n = { "<cmd>GitConflictNextConflict<cr>", "Move to next conflict" },
	p = { "<cmd>GitConflictPreviousConflict<cr>", "Move to previous conflict" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettierd",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"html",
			"json",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
		},
	},
	{
		command = "stylelint",
		filetypes = { "scss", "less", "css", "sass" },
	},
	{
		command = "stylua",
		filetypes = { "lua", "luau" },
	},
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } },
})

-- -- set additional code actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{ command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } },
})

-- Additional Plugins
lvim.plugins = {
	-- Language config mason
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"bash-language-server",
					"lua-language-server",
					"vim-language-server",
					"stylua",
					"shellcheck",
					"editorconfig-checker",
					"json-to-struct",
					"luacheck",
					"misspell",
					"prettierd",
					"eslint_d",
					"cssmodules-language-server",
					"dot-language-server",
				},
				auto_update = true,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"gpanders/editorconfig.nvim",
	},
	-- Git
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 0
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup({
				default_mappings = false, -- disable buffer local mapping created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			})
		end,
	},
	-- jk to escape
	{
		"jdhao/better-escape.vim",
	},
	-- Navigate
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	-- Code action
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "dark",
			})
			require("onedark").load()
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"felipec/vim-sanegx",
		event = "BufRead",
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					width = 30,
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
					},
				},
				buffers = {
					follow_current_file = true,
				},
				filesystem = {
					follow_current_file = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({
				calm_down = true,
				nearest_only = true,
			})

			local activate_hlslens = function(direction)
				local cmd = string.format("normal! %s%szzzv", vim.v.count1, direction)
				local status, msg = pcall(vim.fn.execute, cmd)
				-- 13 is the index where real error message starts
				msg = msg:sub(13)

				if not status then
					vim.api.nvim_echo({ { msg, "ErrorMsg" } }, false, {})
					return
				end
				require("hlslens").start()
			end

			vim.keymap.set("n", "n", "", {
				noremap = true,
				silent = true,
				callback = function()
					activate_hlslens("n")
				end,
			})

			vim.keymap.set("n", "N", "", {
				noremap = true,
				silent = true,
				callback = function()
					activate_hlslens("N")
				end,
			})

			vim.keymap.set("n", "*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>", { silent = true })
			vim.keymap.set("n", "#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>", { silent = true })
		end,
	},
	{
		"gelguy/wilder.nvim",
		requires = {
			"romgrk/fzy-lua-native",
		},
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })

			local highlighters = {
				wilder.pcre2_highlighter(),
				wilder.lua_fzy_highlighter(),
			}

			local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				border = "rounded",
				empty_message = wilder.popupmenu_empty_message_with_spinner(),
				highlighter = highlighters,
				highlights = {
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
					),
				},
				left = {
					" ",
					wilder.popupmenu_devicons(),
					wilder.popupmenu_buffer_flags({
						flags = " a + ",
						icons = { ["+"] = "", a = "", h = "" },
					}),
				},
				right = {
					" ",
					wilder.popupmenu_scrollbar(),
				},
			}))

			local wildmenu_renderer = wilder.wildmenu_renderer({
				highlighter = highlighters,
				separator = " · ",
				left = { " ", wilder.wildmenu_spinner(), " " },
				right = { " ", wilder.wildmenu_index() },
			})

			wilder.set_option(
				"renderer",
				wilder.renderer_mux({
					[":"] = popupmenu_renderer,
					["/"] = wildmenu_renderer,
					substitute = wildmenu_renderer,
				})
			)
		end,
	},
	{
		"elzr/vim-json",
		ft = { "json", "markdown" },
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
