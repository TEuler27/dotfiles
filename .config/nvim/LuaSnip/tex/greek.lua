local h = require("tex_snippet_helpers")

-- Greek letters, all triggered by a one-character prefix (math mode only):
--   ;<lower>  lowercase letter   (;a -> \alpha)
--   ;<Upper>  capital letter     (;D -> \Delta)
--   :<lower>  alternate form     (:o -> \vartheta, :e -> \epsilon)
-- Note: e and f give \varepsilon and \varphi by default; the plain
-- \epsilon and \phi live on the ':' prefix.

local lower = {
  a = "alpha",
  b = "beta",
  g = "gamma",
  d = "delta",
  e = "varepsilon",
  z = "zeta",
  h = "eta",
  o = "theta",
  i = "iota",
  k = "kappa",
  l = "lambda",
  m = "mu",
  n = "nu",
  x = "xi",
  p = "pi",
  r = "rho",
  s = "sigma",
  t = "tau",
  u = "upsilon",
  f = "varphi",
  c = "chi",
  y = "psi",
  w = "omega",
}

local upper = {
  G = "Gamma",
  D = "Delta",
  O = "Theta",
  L = "Lambda",
  X = "Xi",
  P = "Pi",
  S = "Sigma",
  U = "Upsilon",
  F = "Phi",
  Y = "Psi",
  W = "Omega",
}

local alternate = {
  e = "epsilon",
  f = "phi",
  o = "vartheta",
  p = "varpi",
  r = "varrho",
  s = "varsigma",
  k = "varkappa", -- needs amssymb
}

local function prefixed(prefix, map)
  local out = {}
  for key, name in pairs(map) do
    out[prefix .. key] = name
  end
  return out
end

local snippets = {}
vim.list_extend(snippets, h.symbols(prefixed(";", lower)))
vim.list_extend(snippets, h.symbols(prefixed(";", upper)))
vim.list_extend(snippets, h.symbols(prefixed(":", alternate)))
return snippets
