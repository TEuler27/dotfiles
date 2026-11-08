local h = require("tex_snippet_helpers")
local auto = h.auto

-- Auto-close delimiters everywhere (not after a backslash, so "\{" stays as is).
-- '|' is a plain character: use "abs" / "nrm" for absolute values and norms.
local opts = { condition = h.not_escaped }

return {
  auto("(", fmta("(<>)", { h.sel(1) }), opts),
  auto("[", fmta("[<>]", { h.sel(1) }), opts),
  auto("{", fmta("{<>}", { h.sel(1) }), opts),
}
