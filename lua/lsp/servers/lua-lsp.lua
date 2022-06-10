local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local config = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
if not config.lua then
  config.lua = {
    default_config = {
      cmd = {"/usr/bin/lua-language-server"},
      autostart = true,
      filetypes = { "lua" },
      log_level = 2,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        }
      },
      single_file_support = true,
    },
  }
end
