return {
    -- Insert parentheses
    s(
        {
            trig="(",
            dscr="Auto add closing parentheses",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "(<>)",
            { i(1) }
        )
    ),
    -- Insert square parentheses
    s(
        {
            trig="[",
            dscr="Auto add closing square parentheses",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "[<>]",
            { i(1) }
        )
    ),
    -- Insert curly parentheses
    s(
        {
            trig="{",
            dscr="Auto add closing parentheses",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "{<>}",
            { i(1) }
        )
    ),
    -- Insert absolute value
    s(
        {
            trig="|",
            dscr="Auto add closing absolute value",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\lvert <> \\rvert",
            { i(1) }
        )
    ),
}
