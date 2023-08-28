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
    -- simplified vector syntax
    s(
        {trig = "->"},
        fmt(
            [[\vectorarrow{<>}<>]],
            {i(1), i(2)},
            {delimiters = "<>"}
        )
    ),

    -- shorthands for unit vectors
    s(
        {trig = "ihat", snippetType="autosnippet"},
        { t("\\hat{i}")}
    ),
    s(
        {trig = "jhat", snippetType="autosnippet"},
        { t("\\hat{j}")}
    ),
    s(
        {trig = "khat", snippetType="autosnippet"},
        { t("\\hat{k}")}
    ),
    -- uvec, vvec
    s(
        {trig = "uvec", snippetType="autosnippet"},
        { t("\\vectorarrow{u}")}
    ),
    s(
        {trig = "vvec", snippetType="autosnippet"},
        { t("\\vectorarrow{v}")}
    ),

    -- n dimensional space
    s(
        {trig = ";R2", snippetType="autosnippet"},
        {t("\\mathbb{R}^2")}
    ),
    s(
        {trig = ";R3", snippetType="autosnippet"},
        {t("\\mathbb{R}^3")}
    ),
    s(
        {trig = ";Rn", snippetType="autosnippet"},
        {t("\\mathbb{R}^n")}
    ),
}

