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

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
    -- making a const reference
    s(
        {trig = ";cs&", snippetType = "autosnippet"},
        fmt(
            "const <>& <>",
            {d(1, get_visual), i(2)},
            {delimiters="<>"}
        )
    ),
    -- making a vector
    s(
        {trig=";vec", snippetType = "autosnippet"},
        fmt(
            "std::vector<{}> {}",
            {i(1), i(2)},
            {delimiters="{}"}
        )
    ),
    -- making a string
    s(
        {trig=";str", snippetType = "autosnippet"},
        t("std::string")
    ),
}
