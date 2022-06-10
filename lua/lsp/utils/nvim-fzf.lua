local M = {}

local fzf = require("fzf")
local action = require("fzf.actions").action
-- local utils = require("fzf.utils")
local fzf_helpers = require("fzf.helpers")
-- local registery = require("fzf.registry")


-- config
fzf.default_options = {height = '50%'}

local find_cmd = "rg -L -S --hidden --files --glob '!.git'"
local grep_cmd = "rg -L -S --hidden --vimgrep --glob '!.git' -e"

local home = os.getenv("HOME")

local name2folder = {
  ["vim"] = home .. "/.config/nvim/",
  ["sources"] = home .. "/sources/",
}

M.find_fzf = function (cwd)
  local find_command = find_cmd .. " " .. cwd
  local fzf_options = {width=120, height=40}

  -- the transformation function runs for each line in the command
  local fzf_short_path = fzf_helpers.cmd_line_transformer(find_command, function(x)
    return string.gsub(x, cwd, "")
  end)
  local result = fzf.fzf(fzf_short_path, "--expect=ctrl-x,ctrl-s,ctrl-t", fzf_options)
  if result then
    if result[1] == 'ctrl-x' then
      vim.cmd("split " .. result[2])
    elseif result[1] == 'ctrl-v' then
      vim.cmd("vsplit " .. result[2])
    elseif result[1] == 'ctrl-t' then
      vim.cmd("tabedit " .. result[2])
    else
      vim.cmd("edit " .. result[2])
    end
  end
end

M.grep_fzf = function (cwd)
  local re = vim.fn.input("Grep for: ")
  local grep_command = grep_cmd .. " " .. re .. " " .. cwd
  local fzf_options = {width=160, height=50}

  -- the transformation function runs for each line in the command
  local fzf_short_path = fzf_helpers.cmd_line_transformer(grep_command, function(x)
    return x
  end)
  local shell = action(function(items, fzf_lines, fzf_cols)
    local lines =  vim.fn.readfile(vim.fn.matchstr(items[1], "^[^:]*"))
    return lines
  end)
  local result = fzf.fzf(fzf_short_path, "--expect=ctrl-x,ctrl-s,ctrl-t --preview " .. shell, fzf_options)
  if result then
    if result[1] == 'ctrl-x' then
      vim.cmd("split " .. result[2])
    elseif result[1] == 'ctrl-v' then
      vim.cmd("vsplit " .. result[2])
    elseif result[1] == 'ctrl-t' then
      vim.cmd("tabedit " .. result[2])
    else
      vim.cmd("edit " .. result[2])
    end
  end
end

M.find_files = function ()
  local key = vim.fn.input("Enter the key: ")
  if key == "" then return end
  local cwd = name2folder[key]
  if cwd == nil then return end
  local co = coroutine.create(M.find_fzf)
  coroutine.resume(co, cwd)
end

M.grep_files = function ()
  local key = vim.fn.input("Enter the key: ")
  if key == "" then return end
  local cwd = name2folder[key]
  if cwd == nil then return end
  local co = coroutine.create(M.grep_fzf)
  coroutine.resume(co, cwd)
end

return M
