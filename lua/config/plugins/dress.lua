return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            {
                "nvim-lualine/lualine.nvim",
                config = function ()
                   require('lualine').setup({
                      options = {
                          theme = 'tokyonight'
                      },
                   })
                end
            },
            {
                "nvim-tree/nvim-web-devicons",
            },
            "SmiteshP/nvim-navic",
            {
                "utilyre/barbecue.nvim",
                config = function ()
                    require('barbecue').setup{
                        options = {
                            theme = 'tokyonight',
                        }
                    }
                end
            },
        },
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            style = "storm",
            transparent = true,
            -- terminal_colors = true,
            on_colors = function(colors)
                colors.hint = colors.bg
                -- colors.error = "ff0000"
            end,
        },
        config = function ()
           vim.cmd[[colorscheme tokyonight]]
        end,
        -- config = function()
        --   -- load the colorscheme here
        --   -- local tokyonightColors = require("tokyonight.colors")
        --   require("tokyonight").setup({
        --     style = "storm",
        --     transparent = true,
        --     terminal_colors = true,
        --     styles = {
        --         comments = {},
        --         keywords = {},
        --         functions = {},
        --         variables = {},
        --         on_colors = function(colors)
        --             -- colors.hint = colors.bg
        --             -- colors.error = "ff0000"
        --         end,
        --     },
        --   })
        --   -- vim.cmd[[colorscheme tokyonight]]
        -- end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl", 
        opts = {},
    },
    {
        "akinsho/nvim-bufferline.lua",
        config = function()
          local bufferline = require("bufferline")
          bufferline.setup({
            options = {
              numbers = "ordinal",
              style_preset = bufferline.style_preset.no_italic,
            }
          })
        end,
    },
}

