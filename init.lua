set_opt = function(...) vim.api.nvim_set_option(...) end
cmd = function(...) vim.api.nvim_command(...) end

-- load plugins
require('plugs')
require('cfgs')
require('maps')
require('treesitter-cfgs')

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
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


if vim.g.setup == "max" then
  require('cfgs.lsp')
  require('lsp.lsp-cfgs')
end


function lspconfig()
  require('cfgs.lsp')
  require('lsp.lsp-cfgs')
end

require('chatgpt').setup({})
