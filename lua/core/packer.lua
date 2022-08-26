-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

-- local Packer = {}
-- Packer.__index = Packer

-- function Packer:load_plugins()
--   self.repos = {}
-- end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  
  -- lsp or code complete
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin 
  use "williamboman/nvim-lsp-installer"
  use 'ray-x/lsp_signature.nvim'
  use("windwp/nvim-autopairs") -- auto pairs
  use({
    "glepnir/lspsaga.nvim", --- lsp enhance
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  })
  use {'mattn/vim-sonictemplate',
    cmd = 'Template',
    ft = {'go','typescript','lua','javascript','vim','rust','markdown'},
    --config = conf.vim_sonictemplate,
    config = function ()
      vim.g.sonictemplate_postfix_key = '<C-,>'
      vim.g.sonictemplate_vim_template_dir = os.getenv("HOME") .. '/.config/nvim/template'
    end
  }

  use "ravenxrz/DAPInstall.nvim"
  use({
    "ray-x/go.nvim",
    requires = {
            "mfussenegger/nvim-dap", -- Debug Adapter Protocol
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "ray-x/guihua.lua",
    },
  })
  
  -- dess my vim
  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        -- ...
        theme_style = "dark",
        function_style = "italic",
        sidebars = {"qf", "vista_kind", "terminal", "packer"},
        
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        colors = {hint = "orange", error = "#ff0000"},
        overrides = function(c)
          return {
            htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
            DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
            -- this will remove the highlight groups
            TSField = {},
          }
        end
      })
    end
  })
  use 'akinsho/bufferline.nvim'
  use({
   "akinsho/nvim-bufferline.lua",
    config = function()
      require("bufferline").setup({
        options ={
          numbers = "ordinal"
        }
      })
    end,
  })
  -- code 
  use "nvim-treesitter/nvim-treesitter"
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  } 
  -- file explorer
  -- use ({
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = { 
  --     "nvim-lua/plenary.nvim",
  --     --"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   }
  -- })
  use ({
    'kyazdani42/nvim-tree.lua',
    -- requires = {
    --   'kyazdani42/nvim-web-devicons', -- optional, for file icons
    -- },
  })
  use "nvim-telescope/telescope.nvim"
end)

