local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ld", "<cmd>ToggleDiag<cr>", opts)
keymap("n", "<leader>lds", "<cmd>ToggleDiagSigns<cr>", opts)
