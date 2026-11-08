-- Shared helpers for the LaTeX snippets in ~/.config/nvim/LuaSnip/tex/.

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local make_condition = require("luasnip.extras.conditions").make_condition

local M = {}

---------------------------------------------------------------------------
-- Conditions (combine with '*' = and, '+' = or, '-' = not)
---------------------------------------------------------------------------

-- Text before the matched trigger.
local function before_trigger(line_to_cursor, matched_trigger)
  return line_to_cursor:sub(1, #line_to_cursor - #matched_trigger)
end

-- True inside a math zone (as detected by vimtex).
M.in_math = make_condition(function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end)

-- True outside math zones.
M.in_text = -M.in_math

-- True if only whitespace precedes the trigger on its line.
M.line_begin = require("luasnip.extras.conditions.expand").line_begin

-- True unless the trigger is being typed as part of a command name,
-- e.g. the "ll" in "\ell" or the "rr" in "\rightarrow".
-- An even number of backslashes (like the line break "\\") does not count.
M.not_in_command = make_condition(function(line_to_cursor, matched_trigger)
  local before = before_trigger(line_to_cursor, matched_trigger)
  local backslashes = before:match("(\\+)%a*$")
  return backslashes == nil or #backslashes % 2 == 0
end)

-- True unless the trigger directly follows a backslash, e.g. "\{" or "\(".
M.not_escaped = make_condition(function(line_to_cursor, matched_trigger)
  local before = before_trigger(line_to_cursor, matched_trigger)
  local backslashes = before:match("(\\+)$")
  return backslashes == nil or #backslashes % 2 == 0
end)

-- True unless the trigger is part of an index: right after "_" or "^"
-- with only letters, digits or commas in between (a_{nn}, x_{i,nn}, a_nn).
-- "\sum_{n \in nn}" still expands: the space shows it is not an index.
M.not_in_index = make_condition(function(line_to_cursor, matched_trigger)
  local before = before_trigger(line_to_cursor, matched_trigger)
  return before:match("[_^]{?[%w,]*$") == nil
end)

-- Default conditions for math and text snippets.
M.math = M.in_math * M.not_in_command
M.text = M.in_text * M.not_in_command

---------------------------------------------------------------------------
-- Nodes
---------------------------------------------------------------------------

-- Dynamic-node function: pre-fills the insert node with the text stored
-- by store_selection_keys (visual selection), or leaves it empty.
M.get_visual = function(_, parent)
  local selection = parent.snippet.env.LS_SELECT_RAW
  if #selection > 0 then
    return ls.snippet_node(nil, ls.insert_node(1, selection))
  else
    return ls.snippet_node(nil, ls.insert_node(1))
  end
end

-- Insert node at position `index`, pre-filled with the visual selection.
function M.sel(index)
  return ls.dynamic_node(index, M.get_visual)
end

-- Function node returning capture group `n` of a pattern trigger.
function M.cap(n)
  return ls.function_node(function(_, snip)
    return snip.captures[n]
  end)
end

---------------------------------------------------------------------------
-- Snippet builders
---------------------------------------------------------------------------

-- Autosnippet with the conventional defaults:
--   condition = M.math, wordTrig = false, priority = 1000 + #trig
-- (so a longer trigger beats a shorter one it ends with: otimes > times).
-- opts may override condition, wordTrig, priority, trigEngine, dscr.
function M.auto(trig, nodes, opts)
  opts = opts or {}
  return ls.snippet({
    trig = trig,
    dscr = opts.dscr,
    trigEngine = opts.trigEngine,
    wordTrig = opts.wordTrig or false,
    snippetType = "autosnippet",
    condition = opts.condition or M.math,
    priority = opts.priority or (1000 + #trig),
  }, nodes)
end

-- Argument-less commands: { trig = "name" } expands to "\name ".
function M.symbols(map, opts)
  local snippets = {}
  for trig, name in pairs(map) do
    local o = vim.tbl_extend("keep", { dscr = "\\" .. name }, opts or {})
    table.insert(snippets, M.auto(trig, ls.text_node("\\" .. name .. " "), o))
  end
  return snippets
end

-- One-argument commands: { trig = "name" } expands to "\name{<selection>}".
function M.wrappers(map, opts)
  local snippets = {}
  for trig, name in pairs(map) do
    local o = vim.tbl_extend("keep", { dscr = "\\" .. name .. "{}" }, opts or {})
    table.insert(snippets, M.auto(trig, fmta("\\" .. name .. "{<>}", { M.sel(1) }), o))
  end
  return snippets
end

return M
