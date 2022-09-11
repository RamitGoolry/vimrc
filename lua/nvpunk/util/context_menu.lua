--- Create a context menu
---@param prompt string
---@param strings table[string]
---@param funcs table[function]
return function(prompt, strings, funcs)
    vim.ui.select(
        strings,
        { prompt = prompt },
        function(_, idx) vim.schedule(funcs[idx]) end
    )
end
