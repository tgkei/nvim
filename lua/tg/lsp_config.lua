require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "luau_lsp" }
})

local on_attach = function (_, bufnr)
    --local opts = { noremap = true, silent = true }

    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    ---- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    ---- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    --vim.api.nvim_buf_set_keymap(
    --  bufnr,
    --  "n",
    --  "gl",
    --  '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
    --  opts
    --)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', {})
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implemnetation() end, opts)
    vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.diagnostic.config({virtual_text = false})

    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "gl",
      '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
      opts
    )
end

require("lspconfig").luau_lsp.setup {
    on_attach = on_attach
}

require("lspconfig").jedi_language_server.setup {
    on_attach = on_attach
}

require("lspconfig").kotlin_language_server.setup {
    on_attach = on_attach
}
