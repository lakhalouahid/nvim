set_opt = function(...) vim.api.nvim_set_option(...) end
cmd = function(...) vim.api.nvim_command(...) end


TelescopeFolders = {
    ["vim"] = '~/.config/nvim',
    ["sources"] = '~/sources',
    ["projects"] = "~/projects",
    ["downloads"] = "~/Downloads",
    ["ex9"] = "~/projects/ex9",
}

-- load plugins
require('plugs')
require('cfgs')
require('maps')
require("nvim-autopairs").setup({})


lspconfig = function()
    require('treesitter-cfgs')
    require('nvim-tree').setup({
        sync_root_with_cwd = true,
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
    require("surround").setup({ mappings_style = "surround" })
    -- require('dap').setup()
    require('dap-python').setup()
    -- require('move').setup({})
end

if vim.g.setup == "max" then
    lspconfig()
end
