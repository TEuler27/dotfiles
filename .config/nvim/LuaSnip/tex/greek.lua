local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
 
return{
    -- Greek letters
    s(
        {
            trig="g([%a]+)",
            dscr="Auto expand greek letters",
            wordTrig=false,
            regTrig=true,
            snippetType="autosnippet",
            condition=in_mathzone,
        },
        fmta(
            "<>",
            { 
                f(
                    function(args, snip)
                        table = {
                            a="alpha",
                            b="beta",
                            g="gamma",
                            d="delta",
                            x="xi",
                            e="epsilon",
                            ve="varepsilon",
                            vp="varpsi",
                            vf="varphi",
                            h="eta",
                            l="lambda",
                            s="sigma",
                            w="omega",
                            f="phi",
                            ps="psi",
                            pi="pi",
                            m="mu",
                            n="nu",
                            r="rho",
                            z="zeta",
                            i="iota",
                            c="chi",
                            k="kappa",
                            t="tau",
                            o="theta",
                            D="Delta",
                            L="Lambda",
                            S="Sigma",
                            W="Omega",
                            F="Phi",
                            Ps="Psi",
                            P="Pi",
                        }
                        letter = table[snip.captures[1]]
                        if letter ~= nil then
                            return "\\" .. table[snip.captures[1]]
                        else
                            return "g" .. snip.captures[1]
                        end
                    end,
                    {}
                )
            }
        )
    ),
}
