-- vim.g.tokyonight_style == "day"

-- Example config in Lua
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- --
-- Load the colorscheme
vim.cmd[[colorscheme tokyonight-night]]
