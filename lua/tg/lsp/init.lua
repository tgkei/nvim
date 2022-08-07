local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "tg.lsp.lsp-installer"
-- require "tg.lsp.handlers".setup()
