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
    -- Insert displaystyle 
    s(
        {
            trig="disp",
            dscr="Expands 'disp' into a displaystyle command",
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001
        },
        fmta(
            "\\displaystyle",
            {}
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
            trig="sq",
            dscr="Expands 'sq' into a square root",
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
            "\\cos(<>)",
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
            "\\sin(<>)",
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
            trig="int",
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
            trig="([^b])st",
            dscr="Expands 'st' into a set of curly parentheses",
            wordTrig=false,
            regTrig=true,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "<>\\{<>\\}",
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
            trig="sm",
            dscr="Expands 'sm' into a sum",
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
            trig="smf",
            dscr="Expands 'smf' into a full sum with superscript",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sum_{<>}^{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert times command
    s(
        {
            trig="ti",
            dscr="Expands 'ti' into a times command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\times",
            {}
        )
    ),
    -- Insert cdot command
    s(
        {
            trig="cd",
            dscr="Expands 'cd' into a cdot command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\cdot",
            {}
        )
    ),
    -- Insert infty command
    s(
        {
            trig="inf",
            dscr="Expands 'inf' into a infty command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\infty",
            {}
        )
    ),
    -- Insert a plus infty command
    s(
        {
            trig="pinf",
            dscr="Expands 'pinf' into a infty command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,

        },
        fmta(
            "+\\infty",
            {}
        )
    ),
    -- Insert cap command
    s(
        {
            trig="cap",
            dscr="Expands 'cap' into a cap command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\cap",
            {}
        )
    ),
    -- Insert bigcap command 
    s(
        {
            trig="bcap",
            dscr="Expands 'bcap' into a bigcap command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\bigcap_{<>}",
            { i(1) }
        )
    ),
    -- Insert full bigcap command 
    s(
        {
            trig="fbcap",
            dscr="Expands 'fbcap' into a full bigcap command with both super ans sub script",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1002,
        },
        fmta(
            "\\bigcap_{<>}^{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert cup command
    s(
        {
            trig="cup",
            dscr="Expands 'cup' into a cup command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\cup",
            {}
        )
    ),
    -- Insert bigcup command 
    s(
        {
            trig="bcup",
            dscr="Expands 'bcup' into a bigcup command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\bigcup_{<>}",
            { i(1) }
        )
    ),
    -- Insert full bigcup command 
    s(
        {
            trig="fbcup",
            dscr="Expands 'fbcup' into a full bigcup command with both super ans sub script",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1002,
        },
        fmta(
            "\\bigcup_{<>}^{<>}",
            { i(1), i(2) }
        )
    ),
    -- Insert partial command
    s(
        {
            trig="par",
            dscr="Expands 'par' into a partial command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\partial",
            {}
        )
    ),
    -- Insert geq command
    s(
        {
            trig="ge",
            dscr="Expands 'ge' into a geq command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\geq",
            {}
        )
    ),
    -- Insert leq command
    s(
        {
            trig="le",
            dscr="Expands 'le' into a leq command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\leq",
            {}
        )
    ),
    -- Insert ll command
    s(
        {
            trig="ll",
            dscr="Expands 'll' into a ll command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\ll",
            {}
        )
    ),
    -- Insert gg command
    s(
        {
            trig="gg",
            dscr="Expands 'gg' into a gg command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\gg",
            {}
        )
    ),
    -- Insert widetilde command
    s(
        {
            trig="tld",
            dscr="Expands 'tld' into a widetilde command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\widetilde{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert nabla command
    s(
        {
            trig="nab",
            dscr="Expands 'nab' into a nabla command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\nabla",
            {}
        )
    ),
    -- Insert dots command
    s(
        {
            trig="ds",
            dscr="Expands 'ds' into a dots command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\dots",
            {}
        )
    ),
    -- Insert cdots command
    s(
        {
            trig="cds",
            dscr="Expands 'cds' into a cdots command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\cdots",
            {}
        )
    ),
    -- Insert land command
    s(
        {
            trig="la",
            dscr="Expands 'la' into a land command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\land",
            {}
        )
    ),
    -- Insert lor command
    s(
        {
            trig="lo",
            dscr="Expands 'lo' into a lor command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\lor",
            {}
        )
    ),
    -- Insert sym command
    s(
        {
            trig="sym",
            dscr="Expands 'sym' into a sym command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sym",
            {}
        )
    ),
    -- Insert nq command
    s(
        {
            trig="ne",
            dscr="Expands 'ne' into a neq command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\neq",
            {}
        )
    ),
    -- Insert bar command
    s(
        {
            trig="bar",
            dscr="Expands 'bar' into a bar command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\bar",
            {}
        )
    ),
    -- Insert equiv command
    s(
        {
            trig="eq",
            dscr="Expands 'eq' into a equiv command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\equiv",
            {}
        )
    ),
    -- Insert quad command
    s(
        {
            trig="  ",
            dscr="Expands '  ' (two whitespaces) into a quad command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\quad",
            {}
        )
    ),
    -- Insert qquad command
    s(
        {
            trig="   ",
            dscr="Expands '   ' (three whitespaces) into a quad command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\qquad",
            {}
        )
    ),
    -- Insert colon command
    s(
        {
            trig="cl",
            dscr="Expands 'cl' into a colon command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\colon",
            {}
        )
    ),
    -- Insert hat command
    s(
        {
            trig="ht",
            dscr="Expands 'ht' into a hat command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\hat{<>}",
            { d(1, get_visual) }
        )
    ),
    -- Insert setminus command
    s(
        {
            trig="mst",
            dscr="Expands 'mst' into a setminus command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\setminus",
            {}
        )
    ),
    -- Insert ast command
    s(
        {
            trig="as",
            dscr="Expands 'as' into a ast command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\ast",
            {}
        )
    ),
    -- Insert skw command
    s(
        {
            trig="sk",
            dscr="Expands 'sk' into a skw command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\skw",
            {}
        )
    ),
    -- Insert circ command
    s(
        {
            trig="cr",
            dscr="Expands 'cr' into a circ command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\circ",
            {}
        )
    ),
    -- Insert circ command
    s(
        {
            trig="in",
            dscr="Expands 'in' into a in command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\in",
            {}
        )
    ),
    -- Insert to command
    s(
        {
            trig="to",
            dscr="Expands 'to' into a to command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\to",
            {}
        )
    ),
    -- Insert mapsto command
    s(
        {
            trig="mto",
            dscr="Expands 'mto' into a mapsto command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\mapsto",
            {}
        )
    ),
    -- Insert weakto command
    s(
        {
            trig="wto",
            dscr="Expands 'wto' into a weakto command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\weakto",
            {}
        )
    ),
    -- Insert weakstarto command
    s(
        {
            trig="wsto",
            dscr="Expands 'wsto' into a weakstarto command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\weakstarto",
            {}
        )
    ),
    -- Insert sst command
    s(
        {
            trig="sst",
            dscr="Expands 'sst' into a subset command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\subset",
            {}
        )
    ),
    -- Insert otimes command
    s(
        {
            trig="oti",
            dscr="Expands 'oti' into a oti command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
            priority=1001,
        },
        fmta(
            "\\otimes",
            {}
        )
    ),
    -- Insert for all command
    s(
        {
            trig="fra",
            dscr="Expands 'fra' into a forall command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\forall \\, ",
            {}
        )
    ),
}
