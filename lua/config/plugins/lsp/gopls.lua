return {
    setup = function (lspconfig, go_on_attach, lsp)
        local util = require "lspconfig/util"
        lspconfig.gopls.setup {
            cmd = {"gopls", "serve"},
            filetypes = {"go", "gomod"},
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
              },
            },
            golang_setup = {
                on_attach = go_on_attach
            }
          }
    end
}


