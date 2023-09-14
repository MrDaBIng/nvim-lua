local function nvimtree_on_attach(bufnr)
    local api = require "nvim-tree.api"
  
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', '\\',    api.node.open.vertical,                opts('vsplit'))
    vim.keymap.set('n', '-',     api.node.open.horizontal,              opts('horizontal'))
end

return {
    'nvim-tree/nvim-tree.lua',
    config = function ()
        require("nvim-tree").setup ({
            ---
            on_attach = nvimtree_on_attach,
            update_focused_file = {
                 enable = true,
            },
            ---
          })
    end
}

