require("nvim-tree").setup({
  open_on_tab = false,
  view = {
    mappings = {
      list = {
        { key = "-", action = "split" },
        { key = "\\", action = "vsplit" },
      },
    },
  },
    
})

vim.keymap.set("n","tt",":NvimTreeToggle<cr>", { noremap=true, silent=true, buffer=bufnr })
