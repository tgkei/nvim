return {
  {
    "neovim/nvim-lspconfig",
    config = false,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        vim.notify("LSP attached: " .. client.name)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "[", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "]", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts)
      end

      require("mason").setup()

      lspconfig.pyright.setup {
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

      lspconfig.luau_lsp.setup {
        on_attach = on_attach,
      }

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
      }

      lspconfig.kotlin_language_server.setup {
        on_attach = on_attach
      }

      lspconfig.dockerls.setup {
        on_attach = on_attach
      }

      lspconfig.gopls.setup {
        on_attach = on_attach
      }

      lspconfig.rust_analyzer.setup {
        on_attach = on_attach
      }

      lspconfig.bashls.setup {
        on_attach = on_attach
      }

      lspconfig.buf_ls.setup {
        on_attach = on_attach
      }
    end,
  },
}
