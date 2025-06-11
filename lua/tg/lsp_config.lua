require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "luau_lsp" }
})

local on_attach = function (_, bufnr)
    --local opts = { noremap = true, silent = true }

    --vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

    vim.diagnostic.config({virtual_text = false})

    vim.api.nvim_buf_set_keymap(bufnr, "n", "[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', {})

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

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "none"
                }
            }
        }
    }
}

require("lspconfig").kotlin_language_server.setup {
    on_attach = on_attach
}

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}

require("lspconfig").dockerls.setup {
    on_attach = on_attach
}

require("lspconfig").gopls.setup {
    on_attach = on_attach
}

require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach
}

require("lspconfig").bashls.setup {
    on_attach = on_attach
}
