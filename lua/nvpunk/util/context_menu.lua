local M = {}

--- Create a context menu
---@param prompt string
---@param strings table[string]
---@param funcs table[function]
M.uiselect_context_menu = function(prompt, strings, funcs)
    vim.ui.select(
        strings,
        { prompt = prompt },
        function(_, idx) vim.schedule(funcs[idx]) end
    )
end

local MODES = {'i', 'n'}

--- Clear all entries from the given menu
---@param menu string
M.clear_menu = function(menu)
    vim.cmd('aunmenu ' .. menu)
end

--- Create an entry for the right click menu
---@param menu string
---@param label string
---@param action string
M.rclick_context_menu = function(menu, label, action)
    for _, m in ipairs(MODES) do
        vim.cmd(
            m .. 'menu ' .. menu .. '.' ..
            string.gsub(label, ' ', [[\ ]]) .. ' ' ..
            action
        )
    end
end

M.set_lsp_rclick_menu = function()
    M.clear_menu('PopUp')
    local menu_items = {
        {'—————————— LSP ——————————',    '<Nop>'},
        {'Code Actions',                 '<C-f>'},
        {'Go to Declaration',            'gD'},
        {'Go to Definition',             'gd'},
        {'Go to Implementation',         'gI'},
        {'Signature Help',               '<C-k>'},
        {'Rename',                       '<space>rn'},
        {'References',                   'gr'},
        {'Expand Diagnostics',           '<space>e'},
        {'Auto Format',                  '<space>f'},
    }
    for _, i in ipairs(menu_items) do
        M.rclick_context_menu('PopUp', i[1], i[2])
    end
end

return M
