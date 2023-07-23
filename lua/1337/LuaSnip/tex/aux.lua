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
    -- creating a document
    s(
        {trig = ";create"},
        fmt(
            [[
                \documentclass{article}
                \author{Ian Chen}
                \title{<>}
                \date{<>}
                \pagenumbering{arabic}

                \begin{document}
                \maketitle
                \newpage
                <>
                \end{document}
            ]],
            {i(1), i(2, "07-23-2003"), i(3)},
            {delimiters="<>"}
        )
    ),
}
