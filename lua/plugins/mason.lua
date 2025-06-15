return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "luau_lsp",
          "pyright",
          "kotlin_language_server",
          "lua_ls",
          "dockerls",
          "gopls",
          "rust_analyzer",
          "bashls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true }
        local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        -- vim.keymap.set 방식도 가능 (neovim 0.7+)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.diagnostic.config({ virtual_text = false })

        buf_set_keymap("n", "[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
        buf_set_keymap("n", "]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
        buf_set_keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
      end

      local lspconfig = require("lspconfig")

      lspconfig.luau_lsp.setup { on_attach = on_attach }
      lspconfig.pyright.setup {
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "none",
              },
            },
          },
        },
      }
      lspconfig.kotlin_language_server.setup { on_attach = on_attach }
      lspconfig.lua_ls.setup { on_attach = on_attach }
      lspconfig.dockerls.setup { on_attach = on_attach }
      lspconfig.gopls.setup { on_attach = on_attach }
      lspconfig.rust_analyzer.setup { on_attach = on_attach }
      lspconfig.bashls.setup { on_attach = on_attach }
    end,
  },
}
