local M = {}

local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

-- our picker function: colors
local colors = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "colors",
        finder = finders.new_table {
            results = { "red", "green", "blue" }
        },
        sorter = conf.generic_sorter(opts),
    }):find()
end

-- to execute the function
colors()

-- Configuration of telescope

telescope.load_extension("fzy_native")

telescope.setup({
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_ignore_patterns = {'.git', "node_modules", "__pycache__", ".cache"},
        mappings = {
            n = {
                ["C-q"] = false,
            },
        },
    },
    extensions = {
        fzy_native = {override_generic_sorter = false, override_file_sorter = true},
    },
})

-- Variables

M.nameToPrompt = {
    ["vim"] = '< VIM >',
    ["sources"] = '< SOURCES >',
    ["projects"] = "< PRO >"
}


-- Functions

M.grep_files = function()
    local key = vim.fn.input("Enter the key: ")
    local cwd
    local prompt_title
    if key == "" then return end
    for k, v in pairs(TelescopeFolders) do
        if string.find(k, key) >= 0 then
            cwd = v
            prompt_title = k
        end
    end
    require("telescope.builtin").live_grep({
        previewer = false,
        cwd = cwd,
        prompt_title = prompt_title,
        hidden = true,
        layout_strategy = 'vertical',
        attach_mappings = function(prompt_bufnr, map)
            M.handle_actions(prompt_bufnr, map)
            return true
        end,
    })
end

M.grep_files_cwd = function()
    require('telescope.builtin').live_grep();
end


M.find_files = function()
    local key = vim.fn.input("Prompt: ")
    local cwd
    local prompt_title
    print(vim.inspect(TelescopeFolders))
    if key == "" then return end
    for k, v in pairs(TelescopeFolders) do
        if string.find(k, key)  then
            cwd = v
            prompt_title = k
        end
    end
    if not cwd then
        cwd = key
        prompt_title = key
    end
    require("telescope.builtin").find_files({
        previewer = false,
        cwd = cwd,
        prompt_title = prompt_title,
        hidden = true,
        layout_strategy = 'center',
        layout_config = {
            width = 0.4
        },
        attach_mappings = function(prompt_bufnr, map)
            M.handle_actions(prompt_bufnr, map)
            return true
        end,
    })
end


M.find_files_cwd = function()
    require("telescope.builtin").find_files({
        previewer = false,
    })
end

M.man_pages = function()
    require("telescope.builtin").man_pages({
        previewer = false,
        attach_mappings = function(prompt_bufnr, map)
            M.handle_actions(prompt_bufnr, map)
            return true
        end,
    })
end


M.handle_actions = function (prompt_bufnr, map)
    local function toggle_preview()
        action_layout.toggle_preview(prompt_bufnr)
    end
    local function open()
        local entry = action_state.get_selected_entry()
        require("telescope.pickers").on_close_prompt(prompt_bufnr)
        os.execute("xdg-open " .. entry.path)
    end

    map("i", "<C-h>", function()
        toggle_preview()
    end)

    map("i", "<C-o>", function()
        open()
    end)
end

return M
