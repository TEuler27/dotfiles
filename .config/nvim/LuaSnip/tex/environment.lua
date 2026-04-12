local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- New frame environment
    s(
        {
            trig="fra",
            dscr="Expands 'fra' into a new frame environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{frame}
                    <>
                \end{frame}
            ]],
            { i(1) }
        )
    ),
    -- New equation environment
    s(
        {
            trig="equ",
            dscr="Expands 'equ' into a new equation environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            { i(1) }
        )
    ),
    -- New align environment
    s(
        {
            trig="ali",
            dscr="Expands 'ali' into a new align environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            { i(1) }
        )
    ),
    -- New cases environment
    s(
        {
            trig="cas",
            dscr="Expands 'cas' into a new cases environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{cases}
                    <>
                \end{cases}
            ]],
            { i(1) }
        )
    ),
    -- New pmatrix environment
    s(
        {
            trig="pma",
            dscr="Expands 'pma' into a new pmatrix environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{pmatrix}
                    <>
                \end{pmatrix}
            ]],
            { i(1) }
        )
    ),
    -- New bmatrix environment
    s(
        {
            trig="bma",
            dscr="Expands 'bma' into a new bmatrix environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{bmatrix}
                    <>
                \end{bmatrix}
            ]],
            { i(1) }
        )
    ),
    -- New environment
    s(
        {
            trig="env",
            dscr="Expands 'env' into a new environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(2), rep(1) }
        )
    ),
    -- New itemize environment
    s(
        {
            trig="ite",
            dscr="Expands 'ite' into a new itemize environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{itemize}
                    \\item <>
                \end{itemize}
            ]],
            { i(1) }
        )
    ),
    -- New enumerate environment
    s(
        {
            trig="enu",
            dscr="Expands 'enu' into a new enumerate environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{enumerate}
                    \\item <>
                \end{enumerate}
            ]],
            { i(1) }
        )
    ),
}
