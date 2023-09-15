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
    -- shorthand for greek letters
    s(
        {trig = ";a", snippetType="autosnippet"},
        {t("\\alpha")}
    ),
    s(
        {trig = ";b", snippetType="autosnippet"},
        {t("\\beta")}
    ),
    s(
        {trig = ";g", snippetType="autosnippet"},
        {t("\\gamma")}
    ),
    s(
        {trig = ";t", snippetType="autosnippet"},
        {t("\\theta")}
    ),
    s(
        {trig = ";t", snippetType="autosnippet"},
        {t("\\theta")}
    ),
}
