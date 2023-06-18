-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/manhtran/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/manhtran/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/manhtran/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/manhtran/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/manhtran/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nñ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\f€\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3€\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["better-escape.vim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/better-escape.vim",
    url = "https://github.com/jdhao/better-escape.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\nu\0\0\3\0\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\0\0=\1\4\0K\0\1\0\21gitblame_enabled\6g3highlight default link gitblame SpecialComment\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21default_mappings\1\24disable_diagnostics\1\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/christianchiarulli/lir.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14on_attach\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lunar.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/lunar.nvim",
    url = "https://github.com/lunarvim/lunar.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\20mkdp_auto_start\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    config = { "\27LJ\2\nº\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\16auto_update\2\1\14\0\0\25bash-language-server\24lua-language-server\24vim-language-server\vstylua\15shellcheck\25editorconfig-checker\19json-to-struct\rluacheck\rmisspell\14prettierd\reslint_d\31cssmodules-language-server\24dot-language-server\nsetup\25mason-tool-installer\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nó\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\15filesystem\19filtered_items\15never_show\1\3\0\0\14.DS_Store\14thumbs.db\17hide_by_name\1\2\0\0\17node_modules\1\0\2\20hide_gitignored\1\18hide_dotfiles\1\1\0\1\24follow_current_file\2\fbuffers\1\0\1\24follow_current_file\2\vwindow\rmappings\1\0\2\6h\15close_node\6l\topen\1\0\1\nwidth\3\30\1\0\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n“\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\5\0\0\bcss\tscss\thtml\15javascript\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n’\2\0\1\t\0\16\0&6\1\0\0009\1\1\1'\3\2\0006\4\3\0009\4\4\0049\4\5\4\18\5\0\0B\1\4\0026\2\6\0006\4\3\0009\4\a\0049\4\b\4\18\5\1\0B\2\3\3\18\6\3\0009\4\t\3)\a\r\0B\4\3\2\18\3\4\0\14\0\2\0X\4\v€6\4\3\0009\4\n\0049\4\v\0044\6\3\0005\a\f\0>\3\1\a>\a\1\6+\a\1\0004\b\0\0B\4\4\1K\0\1\0006\4\r\0'\6\14\0B\4\2\0029\4\15\4B\4\1\1K\0\1\0\nstart\fhlslens\frequire\1\3\0\0\0\rErrorMsg\14nvim_echo\bapi\bsub\fexecute\afn\npcall\vcount1\6v\bvim\21normal! %s%szzzv\vformat\vstring\27\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\0À\6n\27\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\0À\6NÅ\3\1\0\b\0\22\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0013\0\4\0006\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\b\0'\5\t\0005\6\n\0003\a\v\0=\a\f\6B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\t\0005\6\14\0003\a\15\0=\a\f\6B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\16\0'\5\17\0005\6\18\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\19\0'\5\20\0005\6\21\0B\1\5\0012\0\0€K\0\1\0\1\0\1\vsilent\2?<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>\6#\1\0\1\vsilent\2?<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>\6*\0\1\0\2\fnoremap\2\vsilent\2\6N\rcallback\0\1\0\2\fnoremap\2\vsilent\2\5\6n\bset\vkeymap\bvim\0\1\0\2\17nearest_only\2\14calm_down\2\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\tdark\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/structlog.nvim",
    url = "https://github.com/Tastyep/structlog.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-sanegx"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/vim-sanegx",
    url = "https://github.com/felipec/vim-sanegx"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\ní\6\0\0\14\0.\2N6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0014\1\3\0009\2\6\0B\2\1\2>\2\1\0019\2\a\0B\2\1\0?\2\0\0009\2\b\0009\4\t\0005\6\n\0009\a\v\0B\a\1\2=\a\f\6=\1\r\0065\a\20\0009\b\14\0'\n\15\0'\v\16\0004\f\4\0005\r\17\0>\r\1\f5\r\18\0>\r\2\f5\r\19\0>\r\3\fB\b\4\2=\b\21\a=\a\22\0065\a\23\0009\b\24\0B\b\1\2>\b\2\a9\b\25\0005\n\26\0005\v\27\0=\v\28\nB\b\2\0?\b\1\0=\a\29\0065\a\30\0009\b\31\0B\b\1\0?\b\0\0=\a \6B\4\2\0A\2\0\0029\3!\0005\5\"\0=\1\r\0055\6#\0009\a$\0B\a\1\2>\a\2\6=\6\29\0055\6%\0009\a&\0B\a\1\0?\a\0\0=\6 \5B\3\2\0029\4'\0'\6(\0009\a)\0005\t*\0=\2+\t=\3,\t=\3-\tB\a\2\0A\4\1\1K\0\1\0\15substitute\6/\6:\1\0\0\17renderer_mux\rrenderer\15set_option\19wildmenu_index\1\2\0\0\6 \21wildmenu_spinner\1\4\0\0\6 \0\6 \1\0\1\14separator\t Â· \22wildmenu_renderer\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\nicons\1\0\3\6h\bïœ£\6+\bï£ª\6a\bïœ“\1\0\1\nflags\n a + \27popupmenu_buffer_flags\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\1\0\1\15foreground\f#f4468f\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\18empty_message)popupmenu_empty_message_with_spinner\1\0\1\vborder\frounded\27popupmenu_border_theme\23popupmenu_renderer\24lua_fzy_highlighter\22pcre2_highlighter\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\5€€À™\4\a€€À™\4\0" },
    loaded = true,
    path = "/home/manhtran/.local/share/lunarvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neodev"] = "neodev.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nó\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0005\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\15filesystem\19filtered_items\15never_show\1\3\0\0\14.DS_Store\14thumbs.db\17hide_by_name\1\2\0\0\17node_modules\1\0\2\20hide_gitignored\1\18hide_dotfiles\1\1\0\1\24follow_current_file\2\fbuffers\1\0\1\24follow_current_file\2\vwindow\rmappings\1\0\2\6h\15close_node\6l\topen\1\0\1\nwidth\3\30\1\0\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: mason-tool-installer.nvim
time([[Config for mason-tool-installer.nvim]], true)
try_loadstring("\27LJ\2\nº\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\16auto_update\2\1\14\0\0\25bash-language-server\24lua-language-server\24vim-language-server\vstylua\15shellcheck\25editorconfig-checker\19json-to-struct\rluacheck\rmisspell\14prettierd\reslint_d\31cssmodules-language-server\24dot-language-server\nsetup\25mason-tool-installer\frequire\0", "config", "mason-tool-installer.nvim")
time([[Config for mason-tool-installer.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\tdark\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n’\2\0\1\t\0\16\0&6\1\0\0009\1\1\1'\3\2\0006\4\3\0009\4\4\0049\4\5\4\18\5\0\0B\1\4\0026\2\6\0006\4\3\0009\4\a\0049\4\b\4\18\5\1\0B\2\3\3\18\6\3\0009\4\t\3)\a\r\0B\4\3\2\18\3\4\0\14\0\2\0X\4\v€6\4\3\0009\4\n\0049\4\v\0044\6\3\0005\a\f\0>\3\1\a>\a\1\6+\a\1\0004\b\0\0B\4\4\1K\0\1\0006\4\r\0'\6\14\0B\4\2\0029\4\15\4B\4\1\1K\0\1\0\nstart\fhlslens\frequire\1\3\0\0\0\rErrorMsg\14nvim_echo\bapi\bsub\fexecute\afn\npcall\vcount1\6v\bvim\21normal! %s%szzzv\vformat\vstring\27\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\0À\6n\27\0\0\3\1\1\0\4-\0\0\0'\2\0\0B\0\2\1K\0\1\0\0À\6NÅ\3\1\0\b\0\22\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0013\0\4\0006\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\b\0'\5\t\0005\6\n\0003\a\v\0=\a\f\6B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\t\0005\6\14\0003\a\15\0=\a\f\6B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\16\0'\5\17\0005\6\18\0B\1\5\0016\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\19\0'\5\20\0005\6\21\0B\1\5\0012\0\0€K\0\1\0\1\0\1\vsilent\2?<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>\6#\1\0\1\vsilent\2?<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>\6*\0\1\0\2\fnoremap\2\vsilent\2\6N\rcallback\0\1\0\2\fnoremap\2\vsilent\2\5\6n\bset\vkeymap\bvim\0\1\0\2\17nearest_only\2\14calm_down\2\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nñ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\f€\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3€\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\ní\6\0\0\14\0.\2N6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0014\1\3\0009\2\6\0B\2\1\2>\2\1\0019\2\a\0B\2\1\0?\2\0\0009\2\b\0009\4\t\0005\6\n\0009\a\v\0B\a\1\2=\a\f\6=\1\r\0065\a\20\0009\b\14\0'\n\15\0'\v\16\0004\f\4\0005\r\17\0>\r\1\f5\r\18\0>\r\2\f5\r\19\0>\r\3\fB\b\4\2=\b\21\a=\a\22\0065\a\23\0009\b\24\0B\b\1\2>\b\2\a9\b\25\0005\n\26\0005\v\27\0=\v\28\nB\b\2\0?\b\1\0=\a\29\0065\a\30\0009\b\31\0B\b\1\0?\b\0\0=\a \6B\4\2\0A\2\0\0029\3!\0005\5\"\0=\1\r\0055\6#\0009\a$\0B\a\1\2>\a\2\6=\6\29\0055\6%\0009\a&\0B\a\1\0?\a\0\0=\6 \5B\3\2\0029\4'\0'\6(\0009\a)\0005\t*\0=\2+\t=\3,\t=\3-\tB\a\2\0A\4\1\1K\0\1\0\15substitute\6/\6:\1\0\0\17renderer_mux\rrenderer\15set_option\19wildmenu_index\1\2\0\0\6 \21wildmenu_spinner\1\4\0\0\6 \0\6 \1\0\1\14separator\t Â· \22wildmenu_renderer\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\nicons\1\0\3\6h\bïœ£\6+\bï£ª\6a\bïœ“\1\0\1\nflags\n a + \27popupmenu_buffer_flags\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\1\0\1\15foreground\f#f4468f\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\18empty_message)popupmenu_empty_message_with_spinner\1\0\1\vborder\frounded\27popupmenu_border_theme\23popupmenu_renderer\24lua_fzy_highlighter\22pcre2_highlighter\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\5€€À™\4\a€€À™\4\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21default_mappings\1\24disable_diagnostics\1\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n“\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\5\0\0\bcss\tscss\thtml\15javascript\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-json'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'lsp_signature.nvim', 'gitsigns.nvim', 'vim-sanegx', 'nvim-spectre', 'todo-comments.nvim', 'diffview.nvim', 'git-blame.nvim', 'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'toggleterm.nvim', 'which-key.nvim', 'bufferline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/manhtran/.local/share/lunarvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /home/manhtran/.local/share/lunarvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/manhtran/.local/share/lunarvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
