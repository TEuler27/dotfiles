local h = require("tex_snippet_helpers")

local snippets = {}

-- Math fonts (wrap the visual selection)
vim.list_extend(snippets, h.wrappers({
  cal = "mathcal",
  frak = "mathfrak",
  bb = "mathbb",
  bf = "mathbf",
  itt = "mathit",
  ['"'] = "text",
}))

-- Text fonts: same triggers, text mode only, at the start of a word
vim.list_extend(snippets, h.wrappers({
  bf = "textbf",
  itt = "textit",
}, { condition = h.text, wordTrig = true }))

return snippets
