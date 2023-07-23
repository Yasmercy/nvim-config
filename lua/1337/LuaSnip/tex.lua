-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
    -- greek letter shortcuts
    s(
        {trig = ";a", snippetType="autosnippet"},
        { t("\\alpha") }
    ),
    s(
        {trig = ";b", snippetType="autosnippet"},
        { t("\\beta") }
    ),
    s(
        {trig = ";g", snippetType="autosnippet"},
        { t("\\gamma") }
    ),
    -- environments
    s(
        {trig = "ff", dscr="Expands ff into '\frac{}{}'"},
        fmt(
            [[\frac{<>}{<>}]],
            {i(1), i(2)},
            {delimiters = "<>"}
        )
    ),
    s(
        {trig = "eq"},
        fmt(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            {i(1)},
            {delimiters = "<>"}
        )
    ),
}

