vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {noremap = true, silent = true })

return require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "v", action = "vsplit" },
        { key = "h", action = "split" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

