local M = {}

local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
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

M.nameToFolder = {
  ["vim"]= '~/.config/nvim/',
  ["sources"] = '~/sources/',
  ["projects"] = "~/projects"
}


-- Functions

M.grep_files = function()
  local key = vim.fn.input("Enter the key: ")
  if key == "" then require('telescope.builtin').live_grep(); return end
  require("telescope.builtin").live_grep({
    previewer = false,
    cwd = M.nameToFolder[key],
    prompt_title = M.nameToPrompt[key],
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
  local key = vim.fn.input("Enter the key: ")
  if key == "" then require('telescope.builtin').find_files(); return end
  require("telescope.builtin").find_files({
    previewer = false,
    cwd = M.nameToFolder[key],
    prompt_title = M.nameToPrompt[key],
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
  require('telescope.builtin').find_files();


M.handle_actions = function (prompt_bufnr, map)
	local function toggle_preview()
    action_layout.toggle_preview(prompt_bufnr)
	end

	map("i", "<C-h>", function()
		toggle_preview()
	end)
end

return M
