local M = {}

M.config = {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function ()
            local telescope = require("telescope")
            telescope.setup({})
            --telescope.load_extension("media_files")
        end
    }
}

return M

