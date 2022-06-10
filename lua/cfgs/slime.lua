vim.g.slime_target = "tmux"
vim.g.slime_default_config = {
  ['socket_name'] = vim.fn.get(vim.fn.split(vim.env.TMUX, ','), 0),
  ['target_pane'] = '{top-right}' 
}
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython = 1
