set_opt = function(...) vim.api.nvim_set_option(...) end
cmd = function(...) vim.api.nvim_command(...) end


TelescopeFolders = {
  ["vim"]= '~/.config/nvim',
  ["sources"] = '~/sources',
  ["projects"] = "~/projects",
  ["downloads"] = "~/Downloads"
}

-- load plugins
require('plugs')
require('cfgs')
require('maps')


lspconfig = function ()
    require('treesitter-cfgs')
    require('nvim-tree').setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" }
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
    require('cfgs.lsp')
    require('lsp.lsp-cfgs')
    require('chatgpt').setup({})
end

if vim.g.setup == "max" then
    lspconfig()
end




