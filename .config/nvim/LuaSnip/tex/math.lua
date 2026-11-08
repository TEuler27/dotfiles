local h = require("tex_snippet_helpers")
local auto = h.auto

local snippets = {
  -- Inline math (text mode)
  auto("mm", fmta("$<>$", { h.sel(1) }), { condition = h.text, wordTrig = true }),

  -- Sub- and superscripts
  auto("sb", fmta("_{<>}", { i(1) })),
  auto("sp", fmta("^{<>}", { i(1) })),

  -- Fractions and roots
  auto("ff", fmta("\\frac{<>}{<>}", { h.sel(1), i(2) })),
  auto("um", t("\\frac{1}{2}")),
  auto("sqr", fmta("\\sqrt{<>}", { h.sel(1) })),

  -- Sets, norms and absolute values
  -- ("set " ends in a space because "set" is a prefix of "setminus")
  auto("set ", fmta("\\{ <> \\}", { h.sel(1) }), { wordTrig = true }),
  auto("nrm", fmta("\\lVert <> \\rVert_{<>}", { h.sel(1), i(2) })),
  auto("abs", fmta("\\lvert <> \\rvert", { h.sel(1) })),

  -- Function spaces
  auto("sob", fmta("W^{<>}(<>;<>)", { i(1), i(2), i(3) })),

  -- Sums and integrals: name = lower limit, f + name = both limits
  auto("sum", fmta("\\sum_{<>}", { i(1) })),
  auto("fsum", fmta("\\sum_{<>}^{<>}", { i(1), i(2) })),
  auto("int", fmta("\\int_{<>}", { i(1) })),
  auto("fint", fmta("\\int_{<>}^{<>}", { i(1), i(2) })),

  -- Exponents for number sets: \R 2 -> \R^{2}, then \R^{n}m -> \R^{n \times m}
  auto(
    "\\([RNZ]) ?([%dNnmdk+])",
    fmta("\\<>^{<>}", { h.cap(1), h.cap(2) }),
    { trigEngine = "pattern", priority = 1100, dscr = "Exponent for a number set" }
  ),
  auto(
    "\\([RNZ])^{([%dNnmdk])}([%dNnmdk])",
    fmta("\\<>^{<> \\times <>}", { h.cap(1), h.cap(2), h.cap(3) }),
    { trigEngine = "pattern", priority = 1100, dscr = "Second exponent for a number set" }
  ),
}

-- Number sets (not expanded inside indices such as a_{nn})
vim.list_extend(snippets, h.symbols(
  { rr = "R", nn = "N", zz = "Z" },
  { condition = h.math * h.not_in_index }
))

-- Functions and differentials
vim.list_extend(snippets, h.symbols({
  cos = "cos",
  sin = "sin",
  dd = "dd",
}))

return snippets
