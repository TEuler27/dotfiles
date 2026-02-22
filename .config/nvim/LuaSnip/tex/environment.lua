local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- New frame environment
    s(
        {
            trig="frm",
            dscr="Expands 'frm' into a new frame environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{frame}
                    <>
                \end{frame}
            ]],
            { i(1, "Frame content here") }
        )
    ),
    -- New equation environment
    s(
        {
            trig="eq",
            dscr="Expands 'eq' into a new equation environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            { i(1, "Math here") }
        )
    ),
    -- New align environment
    s(
        {
            trig="al",
            dscr="Expands 'al' into a new align environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            { i(1, "Math here") }
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
            { i(1, "Math here") }
        )
    ),
    -- New pmatrix environment
    s(
        {
            trig="pmt",
            dscr="Expands 'pmt' into a new pmatrix environment",
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
            trig="bmt",
            dscr="Expands 'bmt' into a new bmatrix environment",
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
            trig="it",
            dscr="Expands 'it' into a new itemize environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{itemize}
                    <>
                \end{itemize}
            ]],
            { i(1) }
        )
    ),
    -- New enumerate environment
    s(
        {
            trig="en",
            dscr="Expands 'en' into a new enumerate environment",
            snippetType="autosnippet",
            condition=line_begin
        },
        fmta(
            [[
                \begin{enumerate}
                    <>
                \end{enumerate}
            ]],
            { i(1) }
        )
    ),
}
