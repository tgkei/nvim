local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "tg.lsp.lsp-installer"
require "tg.lsp.handlers".setup()
require "tg.lsp.scala"

-- scala needs to be configured by itself
-- local util = require("lspconfig.util")
-- require'lspconfig'.metals.setup{
--   util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", "build.gradle.kts")
-- }

