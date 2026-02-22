return{
    -- New reference
    s(
        {
            trig="rf",
            dscr="Expands 'rf' into a ref command",
            snippetType="autosnippet",
        },
        fmta(
            "\\ref{<>}",
            { i(1) }
        )
    ),
    -- New Creference
    s(
        {
            trig="crf",
            dscr="Expands 'crf' into a cref command",
            snippetType="autosnippet",
        },
        fmta(
            "\\Cref{<>}",
            { i(1) }
        )
    ),
    -- New equation reference
    s(
        {
            trig="eqr",
            dscr="Expands 'eqr' into a eqref command",
            snippetType="autosnippet",
        },
        fmta(
            "\\eqref{<>}",
            { i(1) }
        )
    ),
    -- New label
    s(
        {
            trig="lbl",
            dscr="Expands 'lbl' into a label command",
            snippetType="autosnippet",
        },
        fmta(
            "\\label{<>:<>}",
            { i(1), i(2) }
        )
    ),
    -- New citation
    s(
        {
            trig="ct",
            dscr="Expands 'ct' into a cite command",
            snippetType="autosnippet",
        },
        fmta(
            "\\cite{<>}",
            { i(1) }
        )
    ),
    -- New precise citation
    s(
        {
            trig="pct",
            dscr="Expands 'pct' into a cite command with optional parameter",
            snippetType="autosnippet",
        },
        fmta(
            "\\cite[<>]{<>}",
            { i(1), i(2) }
        )
    ),
}
