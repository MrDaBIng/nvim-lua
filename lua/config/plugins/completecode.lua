local M = {}

M.config = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-nvim-lua"},
	{"hrsh7th/cmp-calc"},
        {'saadparwaiz1/cmp_luasnip'}, -- Snippets source for nvim-cmp
        {'L3MON4D3/LuaSnip'}, -- Snippets plugin 
        {"windwp/nvim-autopairs"} -- auto pairs
    },

    config = function ()
        -- luasnip setup
        local luasnip = require 'luasnip'
        -- nvim-cmp setup
        local cmp = require 'cmp'
        cmp.setup {
          preselect = cmp.PreselectMode.Item,
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
        		["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-e>"] = cmp.mapping.close(),
            ['<A-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          }),
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = "buffer" },
            { name = "path" },
          },
        }

        require("nvim-autopairs").setup()
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}

return M

