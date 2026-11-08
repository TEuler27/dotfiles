local h = require("tex_snippet_helpers")
local auto = h.auto

-- Text environments: at the start of a line, outside math
local text_env = { condition = h.in_text * h.line_begin }
-- Math-only environments: anywhere in math, at the start of a word
local math_env = { condition = h.math, wordTrig = true }

local function env(name)
  return fmta(
    [[
      \begin{]] .. name .. [[}
          <>
      \end{]] .. name .. [[}
    ]],
    { i(1) }
  )
end

return {
  auto("fra", env("frame"), text_env),
  auto("equ", env("equation"), text_env),
  auto("ali", env("align"), text_env),
  auto("ite", fmta(
    [[
      \begin{itemize}
          \item <>
      \end{itemize}
    ]],
    { i(1) }
  ), text_env),
  auto("enu", fmta(
    [[
      \begin{enumerate}
          \item <>
      \end{enumerate}
    ]],
    { i(1) }
  ), text_env),
  auto("env", fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    { i(1), i(2), rep(1) }
  ), text_env),

  auto("cas", env("cases"), math_env),
  auto("pma", env("pmatrix"), math_env),
  auto("bma", env("bmatrix"), math_env),
}
