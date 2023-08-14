return {
    'nvimdev/lspsaga.nvim',
    dependencies = {},
    config = function()
        require('lspsaga').setup({})
    end,
    event = 'LspAttach'
}

