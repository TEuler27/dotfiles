local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
    -- Insert calliigraphic math
    s(
        {
            trig="cal",
            dscr="Expands 'cal' into a mathcal command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\mathcal{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert blackboard math
    s(
        {
            trig="bb",
            dscr="Expands 'bb' into a mathbb command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\mathbb{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert boldface
    s(
        {
            trig="bf",
            dscr="Expands 'bf' into a textbf command",
            wordTrig=false,
            snippetType="autosnippet",
        },
        fmta(
            "\\mathbf{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert boldface
    s(
        {
            trig="it",
            dscr="Expands 'it' into a textit command",
            snippetType="autosnippet",
        },
        fmta(
            "\\mathit{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert text
    s(
        {
            trig="\"",
            dscr="Expands quote symbol into a text command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\text{<>}",
            { i(1) }
        )
    ),
}
