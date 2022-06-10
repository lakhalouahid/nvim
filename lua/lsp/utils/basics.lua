local M = {}

M.reload = function(module)
  require('plenary.reload').reload_module(module)
end

return M

