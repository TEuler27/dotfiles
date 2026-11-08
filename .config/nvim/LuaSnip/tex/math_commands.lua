local h = require("tex_snippet_helpers")
local auto = h.auto

local snippets = {
  -- Spacing: two spaces -> \quad (not right after a command, so typing a
  -- space after e.g. "\times " does not produce a \quad)
  auto("  ", t("\\quad "), { dscr = "\\quad" }),

  -- Big operators: b + name = lower limit, fb + name = both limits
  auto("bcap", fmta("\\bigcap_{<>}", { i(1) })),
  auto("fbcap", fmta("\\bigcap_{<>}^{<>}", { i(1), i(2) })),
  auto("bcup", fmta("\\bigcup_{<>}", { i(1) })),
  auto("fbcup", fmta("\\bigcup_{<>}^{<>}", { i(1), i(2) })),
}

-- Argument-less commands: trigger -> command name (expands to "\name ")
vim.list_extend(snippets, h.symbols({
  -- Operators
  times = "times",
  otimes = "otimes",
  cdot = "cdot",
  ast = "ast",
  circ = "circ",
  cap = "cap",
  cup = "cup",
  setminus = "setminus",
  land = "land",
  lor = "lor",
  -- Relations and arrows
  geq = "geq",
  leq = "leq",
  neq = "neq",
  ll = "ll",
  gg = "gg",
  sim = "sim",
  equiv = "equiv",
  subset = "subset",
  to = "to",
  mapsto = "mapsto",
  weakto = "weakto",
  weakstar = "weakstarto",
  -- Other symbols
  infty = "infty",
  partial = "partial",
  nabla = "nabla",
  dot = "dots",
  colon = "colon",
  skw = "skw",
  qquad = "qquad",
  disp = "displaystyle",
  ["for"] = "forall \\,",
}))

-- Triggers that are a prefix of another trigger end in a space:
-- "in " (vs "int", "infty") and "inf " (vs "infty").
vim.list_extend(snippets, h.symbols({
  ["in "] = "in",
  ["inf "] = "inf",
}, { wordTrig = true }))

-- Accents and decorations (wrap the visual selection)
vim.list_extend(snippets, h.wrappers({
  tilde = "widetilde",
  hat = "widehat",
  bar = "bar",
  over = "overline",
  under = "underline",
}))

return snippets
