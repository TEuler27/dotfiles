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
    -- Insert times command
    s(
        {
            trig="times",
            dscr="Expands 'times' into a times command",
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
            trig="cdot",
            dscr="Expands 'cdot' into a cdot command",
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
            trig="\\infty",
            dscr="Expands 'infty' into a infty command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\infty",
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
            trig="partial",
            dscr="Expands 'partial' into a partial command",
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
            trig="geq",
            dscr="Expands 'geq' into a geq command",
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
            trig="leq",
            dscr="Expands 'leq' into a leq command",
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
            trig="wide",
            dscr="Expands 'wide' into a widetilde command",
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
            trig="nabla",
            dscr="Expands 'nabla' into a nabla command",
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
            trig="dot",
            dscr="Expands 'dot' into a dots command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\dots",
            {}
        )
    ),
    -- Insert land command
    s(
        {
            trig="land",
            dscr="Expands 'land' into a land command",
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
            trig="lor",
            dscr="Expands 'lor' into a lor command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\lor",
            {}
        )
    ),
    -- Insert sim command
    s(
        {
            trig="sim",
            dscr="Expands 'sim' into a sim command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\sim",
            {}
        )
    ),
    -- Insert neq command
    s(
        {
            trig="neq",
            dscr="Expands 'neq' into a neq command",
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
            trig="equiv",
            dscr="Expands 'equiv' into a equiv command",
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
            "\\quad ",
            {}
        )
    ),
    -- Insert qquad command
    s(
        {
            trig="\\quad  ",
            dscr="Expands '    ' (four whitespaces) into a quad command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            " \\qquad ",
            {}
        )
    ),
    -- Insert colon command
    s(
        {
            trig="colon",
            dscr="Expands 'colon' into a colon command",
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
            trig="hat",
            dscr="Expands 'hat' into a hat command",
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
            trig="\\{ minus",
            dscr="Expands 'setminus' into a setminus command",
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\setminus<>",
            { i(1) }
        ),
        {
            callbacks = {
                [-1] = {
                    [events.pre_expand] = function(_, event_args)
                        local row = event_args.expand_pos[1] 
                        local col = event_args.expand_pos[2]  
                        vim.api.nvim_buf_set_text(0, row, col, row, col + 3, {})
                    end,
                },
            },
        }
    ),
    -- Insert ast command
    s(
        {
            trig="ast",
            dscr="Expands 'ast' into a ast command",
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
            trig="skw",
            dscr="Expands 'skw' into a skw command",
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
            trig="circ",
            dscr="Expands 'circ' into a circ command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\circ",
            {}
        )
    ),
    -- Insert in command
    s(
        {
            trig="in",
            dscr="Expands 'in' into a in command",
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
            trig="mapsto",
            dscr="Expands 'mapsto' into a mapsto command",
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
            trig="weakto",
            dscr="Expands 'weakto' into a weakto command",
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
            trig="weakstar",
            dscr="Expands 'weakstar' into a weakstarto command",
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
            trig="subset",
            dscr="Expands 'subset' into a subset command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\subset",
            {}
        )
    ),
    -- Insert otimes command
    s(
        {
            trig="otimes",
            dscr="Expands 'otimes' into a oti command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\otimes",
            {}
        )
    ),
    -- Insert for all command
    s(
        {
            trig="for",
            dscr="Expands 'for' into a forall command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\forall \\, ",
            {}
        )
    ),
    -- Insert overline command
    s(
        {
            trig="over",
            dscr="Expands 'over' into a overline command",
            wordTrig=false,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "\\overline{<>}",
            { d(1, get_visual) }
        )
    ),
}
