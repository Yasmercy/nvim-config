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
    s(
        {trig = ";vec", snippetType="autosnippet"},
        fmt(
            [[std::vector<{}>{}]],
            {i(1), i(2)},
            {delimiters = "{}"}
        )
    ),    
    s(
        {trig=";str", snippetType = "autosnippet"},
        t("std::string")
    ),
    s(
        {trig = ";umap", snippetType="autosnippet"},
        fmt(
            [[std::unordered_map<{}, {}>{}]],
            {i(1), i(2), i(3)},
            {delimiters = "{}"}
        )
    ),
    s(
        {trig = ";map", snippetType="autosnippet"},
        fmt(
            [[std::map<{}, {}>{}]],
            {i(1), i(2), i(3)},
            {delimiters = "{}"}
        )
    ),
    s(
        {trig = ";uset", snippetType="autosnippet"},
        fmt(
            [[std::unordered_set<{}>{}]],
            {i(1), i(2)},
            {delimiters = "{}"}
        )
    ),
    s(
        {trig = ";set", snippetType="autosnippet"},
        fmt(
            [[std::set<{}>{}]],
            {i(1), i(2)},
            {delimiters = "{}"}
        )
    ),
    s(
        {trig = ";pair", snippetType="autosnippet"},
        fmt(
            [[std::pair<{}, {}>{}]],
            {i(1), i(2), i(3)},
            {delimiters = "{}"}
        )
    ),
}
