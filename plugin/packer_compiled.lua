-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/show/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/show/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/show/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/show/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/show/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/ravenxrz/DAPInstall.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n?\1\0\1\4\0\n\0\f5\1\5\0005\2\1\0009\3\0\0=\3\2\0029\3\3\0=\3\4\2=\2\6\0015\2\a\0=\2\b\0014\2\0\0=\2\t\1L\1\2\0\fTSField\19DiagnosticHint\1\0\1\tlink\30LspDiagnosticsDefaultHint\fhtmlTag\1\0\0\asp\thint\afg\1\0\2\nstyle\14underline\abg\f#282c34\bred?\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\thint\vorange\nerror\f#ff0000\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\2\19function_style\vitalic\16theme_style\tdark\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\fnumbers\fordinal\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/show/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-sonictemplate"] = {
    commands = { "Template" },
    config = { "\27LJ\2\n?\1\0\0\4\0\t\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\5\0009\1\6\1'\3\a\0B\1\2\2'\2\b\0&\1\2\1=\1\4\0K\0\1\0\27/.config/nvim/template\tHOME\vgetenv\aos#sonictemplate_vim_template_dir\n<C-,>\30sonictemplate_postfix_key\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/show/.local/share/nvim/site/pack/packer/opt/vim-sonictemplate",
    url = "https://github.com/mattn/vim-sonictemplate"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\fnumbers\fordinal\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n?\1\0\1\4\0\n\0\f5\1\5\0005\2\1\0009\3\0\0=\3\2\0029\3\3\0=\3\4\2=\2\6\0015\2\a\0=\2\b\0014\2\0\0=\2\t\1L\1\2\0\fTSField\19DiagnosticHint\1\0\1\tlink\30LspDiagnosticsDefaultHint\fhtmlTag\1\0\0\asp\thint\afg\1\0\2\nstyle\14underline\abg\f#282c34\bred?\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14overrides\0\vcolors\1\0\2\thint\vorange\nerror\f#ff0000\rsidebars\1\5\0\0\aqf\15vista_kind\rterminal\vpacker\1\0\2\19function_style\vitalic\16theme_style\tdark\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Template lua require("packer.load")({'vim-sonictemplate'}, { cmd = "Template", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-sonictemplate'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/show/.local/share/nvim/site/pack/packer/opt/vim-sonictemplate/ftdetect/stpl.vim]], true)
vim.cmd [[source /Users/show/.local/share/nvim/site/pack/packer/opt/vim-sonictemplate/ftdetect/stpl.vim]]
time([[Sourcing ftdetect script at: /Users/show/.local/share/nvim/site/pack/packer/opt/vim-sonictemplate/ftdetect/stpl.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
