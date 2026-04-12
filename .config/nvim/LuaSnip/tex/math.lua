local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  
        return sn(nil, i(1))
    end
end

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
 
return {
    -- Insert inline math
    s(
        {
            trig="mm",
            dscr="Expands 'mm' into an inline math area",
            snippetType="autosnippet",
        },
        fmta(
            "$<>$",
            { d(1, get_visual) }
        )
    ),
    -- Insert subscript 
    s(
        {
            trig="sb",
            dscr="Expands 'sb' into a subscript",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "_{<>}",
            { i(1) }
        )
    ),
    -- Insert superscript 
    s(
        {
            trig="sp",
            dscr="Expands 'sp' into a superscript",
            trigEngine="vim",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "^{<>}",
            { i(1) }
        )
    ),
    -- Insert Sobolev space
    s(
        {
            trig="sob",
            dsce="Expands 'sob' into a Sobolev space",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "W^{<>}(<>;<>)",
            { i(1), i(2), i(3) }
        )
    ),
    -- Insert fraction
    s(
        {
            trig="ff",
            dscr="Expands 'ff' into a frac command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\frac{<>}{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert one half
    s(
        {
            trig="um",
            dscr="Expands 'um' into a one half fraction",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\frac{1}{2}",
            {}
        )
    ),
    -- Insert square root
    s(
        {
            trig="sqr",
            dscr="Expands 'sqr' into a square root",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sqrt{<>}",
            { i(1) }
        )
    ),
    -- Insert real number
    s(
        {
            trig="rr",
            dscr="Expands 'rr' into a blackboard R",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\R",
            {}
        )
    ),
    -- Insert cosine
    s(
        {
            trig="cos",
            dscr="Expands 'cos' into a cosine function",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\cos<>",
            { i(1) }
        )
    ),
    -- Insert sine
    s(
        {
            trig="sin",
            dscr="Expands 'sin' into a sine function",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sin<>",
            { i(1) }
        )
    ),
    -- Insert differential
    s(
        {
            trig="dd",
            dscr="Expands 'dd' into a differential",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\, d",
            {}
        )
    ),
    -- Insert superscript for reals
    s(
        {
            trig="\\R([0-9Nnmdk])",
            dscr="Automatically add exponent to reals",
            wordTrig=false,
            regTrig=true,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\R^{<>}",
            { f( function(_, snip) return snip.captures[1] end ) }
        )
    ),
    -- Insert double superscript for real matrices
    s(
        {
            trig="\\R^{([0-9Nnmdk])}([0-9Nnmdk])",
            dscr="Automatically add second exponent to reals",
            wordTrig=false,
            regTrig=true,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\R^{<> \\times <>}",
            { f( function(_, snip) return snip.captures[1] end ), f( function(_, snip) return snip.captures[2] end ) }
        )
    ),
    -- Insert integral 
    s(
        {
            trig="\\int",
            dscr="Expands 'int' into an integral",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\int_{<>}",
            { i(1) }
        )
    ),
    -- Insert line integral 
    s(
        {
            trig="rint",
            dscr="Expands 'rint' into an integral",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\int_{<>}^{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert set
    s(
        {
            trig="set([^m])",
            dscr="Expands 'set' into a set of curly parentheses",
            wordTrig=false,
            regTrig=true,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\{<><>\\}",
            { f( function(_, snip) return snip.captures[1] end ), i(1) }
        )
    ),
    -- Insert norm 
    s(
        {
            trig="nrm",
            dscr="Expands 'nrm' into a norm",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\lVert<>\\rVert_{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert sum
    s(
        {
            trig="sum",
            dscr="Expands 'sum' into a sum",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sum_{<>}",
            { i(1) }
        )
    ),
    -- Insert full sum
    s(
        {
            trig="fsum",
            dscr="Expands 'fsum' into a full sum with superscript",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sum_{<>}^{<>}",
            { i(1), i(2) }
        )
    ),
}
