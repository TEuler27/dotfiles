local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  
        return sn(nil, i(1))
    end
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
    -- Insert boldface math 
    s(
        {
            trig="bf",
            dscr="Expands 'bf' into a mathbf command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\mathbf{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert italic
    s(
        {
            trig="bf",
            dscr="Expands 'bf' into a mathbf command",
            wordTrig=false,
            snippetType="autosnippet",
        },
        fmta(
            "\\textbf{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert italic
    s(
        {
            trig="itt",
            dscr="Expands 'itt' into a textit command",
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
            { d(1, get_visual) }
        )
    ),
}
