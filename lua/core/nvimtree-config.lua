require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "l", action = "edit" },
        { key = " ", action = "toggle_mark" },
      },
    },
  },
    
})

vim.keymap.set("n","tt",":NvimTreeToggle<cr>", { noremap=true, silent=true, buffer=bufnr })
