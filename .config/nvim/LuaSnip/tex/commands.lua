local h = require("tex_snippet_helpers")
local auto = h.auto

-- References and citations work in text and math (e.g. \overset{\eqref{}}{=}),
-- but only at the start of a word.
local opts = { condition = h.not_in_command, wordTrig = true }

return {
  auto("rf", fmta("\\ref{<>}", { i(1) }), opts),
  auto("crf", fmta("\\Cref{<>}", { i(1) }), opts),
  auto("eqr", fmta("\\eqref{<>}", { i(1) }), opts),
  auto("lbl", fmta("\\label{<>:<>}", { i(1), i(2) }), opts),
  auto("ct", fmta("\\cite{<>}", { i(1) }), opts),
  auto("pct", fmta("\\cite[<>]{<>}", { i(1), i(2) }), opts),
}
