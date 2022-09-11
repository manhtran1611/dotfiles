local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local opts = { noremap = true, silent = true }

local M = {}
-- n, v, i, t = mode names

M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "beginning of line" },
		["<C-e>"] = { "<End>", "end of line" },

		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "move left" },
		["<C-l>"] = { "<Right>", "move right" },
		["<C-j>"] = { "<Down>", "move down" },
		["<C-k>"] = { "<Up>", "move up" },
	},

	n = {
		["<TAB>"] = { "<%>", "Jump to matching pairs easier" },
		["<leader>n"] = { "<cmd> noh <CR>", "no highlight" },

		-- switch between windows
		["<C-h>"] = { "<C-w>h", "window left" },
		["<C-l>"] = { "<C-w>l", "window right" },
		["<C-j>"] = { "<C-w>j", "window down" },
		["<C-k>"] = { "<C-w>k", "window up" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "save file" },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

		-- update nvchad
		["<leader>uu"] = { "<cmd> :NvChadUpdate <CR>", "update nvchad" },

		["<leader>tt"] = {
			function()
				require("base46").toggle_theme()
			end,
			"toggle theme",
		},

		["<A-j>"] = { "<cmd>:MoveLine(1)<CR>", "Move line down 1 line", opts },
		["<A-k>"] = { "<cmd>:MoveLine(-1)<CR>", "Move line up 1 line", opts },

		-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
		-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
		-- empty mode is same as using <cmd> :map
		-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

		-- new buffer
		["<leader>b"] = { "<cmd> enew <CR>", "new buffer" },

		-- close buffer + hide terminal buffer
		["<S-q>"] = {
			function()
				require("core.utils").close_buffer()
			end,
			"close buffer",
		},
	},

	t = { ["<C-x>"] = { termcodes("<C-\\><C-N>"), "escape terminal mode" } },

	v = {

		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["<"] = { "<gv", "Continuous visual shifting left" },
		[">"] = { ">gv", "Continuous visual shifting right" },
		-- Don't copy the replaced text after pasting in visual mode
		-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
		["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },

		-- Move block of code down or up
		["<A-j>"] = { "<cmd>:MoveBlock(1)<CR>", "Move block down 1 line", opts },
		["<A-k>"] = { "<cmd>:MoveBlock(-1)<CR>", "Move block up 1 line", opts },
	},
}

M.tabufline = {
	plugin = true,

	n = {
		-- cycle through buffers
		["<S-l>"] = {
			function()
				require("core.utils").tabuflineNext()
			end,
			"goto next buffer",
		},

		["<S-h>"] = {
			function()
				require("core.utils").tabuflinePrev()
			end,
			"goto prev buffer",
		},

		-- pick buffers via numbers
		["<Bslash>"] = { "<cmd> TbufPick <CR>", "Pick buffer" },
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<leader>/"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},

		["gh"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"lsp definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"lsp code_action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"floating diagnostic",
		},

		["<leader>["] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"goto prev",
		},

		["<leader>]"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.formatting({})
			end,
			"lsp formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"list workspace folders",
		},
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		-- toggle
		["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },
		-- Git conflict
		["<leader>gl"] = { "<cmd> Gitsigns blame_line <CR>", "Show blame line" },
		["<leader>gn"] = { "<cmd> GitConflictNextConflict <CR>", "Show next conflict" },
		["<leader>gp"] = { "<cmd> GitConflictPrevConflict <CR>", "Show previous conflict" },
		["<leader>gco"] = { "<cmd> GitConflictChooseOurs <CR>", "Choose ours changes" },
		["<leader>gcb"] = { "<cmd> GitConflictChooseBoth <CR>", "Choose both Ours & Theirs changes" },
		["<leader>gct"] = { "<cmd> GitConflictChooseTheirs <CR>", "Choose theirs changes" },

		-- pick a hidden term
		["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

		-- theme switcher
		["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
	},
}

M.nvterm = {
	plugin = true,

	t = {
		-- toggle in terminal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},

		-- new

		["<leader>h"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"new horizontal term",
		},

		["<leader>v"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"new vertical term",
		},
	},
}

M.whichkey = {
	plugin = true,

	n = {
		["<leader>wK"] = {
			function()
				vim.cmd("WhichKey")
			end,
			"which-key all keymaps",
		},
		["<leader>wk"] = {
			function()
				local input = vim.fn.input("WhichKey: ")
				vim.cmd("WhichKey " .. input)
			end,
			"which-key query lookup",
		},
	},
}

M.blankline = {
	plugin = true,

	n = {
		["<leader>cc"] = {
			function()
				local ok, start = require("indent_blankline.utils").get_current_context(
					vim.g.indent_blankline_context_patterns,
					vim.g.indent_blankline_use_treesitter_scope
				)

				if ok then
					vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
					vim.cmd([[normal! _]])
				end
			end,

			"Jump to current_context",
		},
	},
}

return M
