-- Mappings

-- See `:help vim.lsp.*` for documentation on any of the below functions
-- local function buf_set_keymap(...) vim.api.nvim_set_keymap(...) end
-- local opts = { noremap=true, silent=false }
-- buf_set_keymap('n', '<space>dl', '<cmd>lua vim.cmd("vsp"..vim.lsp.get_log_path())<CR>', opts)
-- buf_set_keymap('n', '<space>pF', '<cmd>lua require("lsp.utils.telescope").find_files()<CR>', opts)
-- buf_set_keymap('n', '<space>pf', '<cmd>lua require("lsp.utils.telescope").find_files_cwd()<CR>', opts)
-- buf_set_keymap('n', '<space>pG', '<cmd>lua require("lsp.utils.telescope").grep_files()<CR>', opts)
-- buf_set_keymap('n', '<space>pg', '<cmd>lua require("lsp.utils.telescope").grep_files_cwd()<CR>', opts) 

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
