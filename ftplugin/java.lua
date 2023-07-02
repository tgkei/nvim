local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/user/.config/nvim/jdt/data/' .. project_name

local on_attach = function (client, bufnr)
    -- require'lsp'.common_on_attach(client, bufr)
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

local config = {
  -- TG keymap
  on_attach = on_attach,

  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- 💀
    -- TG: LOMBOCK
    "-javaagent:/Users/user/.config/nvim/jdt/lombok/lombok.jar",
    "-Xbootclasspath/a:/Users/user/.config/nvim/jdt/lombok/lombok.jar",

    -- 💀
    '-jar', '/Users/user/.config/nvim/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    '-configuration', '/Users/user/.config/nvim/jdt/config_mac',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}

local nvim_jdtls_status_ok, nvim_jdtls = pcall(require, "jdtls")
if not nvim_jdtls_status_ok then
    return
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
nvim_jdtls.start_or_attach(config)

