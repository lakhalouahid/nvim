set_opt = function(...) vim.api.nvim_set_option(...) end
cmd = function(...) vim.api.nvim_command(...) end
-- load plugins
require('plugs')
require('cfgs')
require('maps')

function lspconfig()
  require('cfgs.lsp')
  require('lsp.lsp-cfgs')
end



