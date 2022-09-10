local M = {}

M.wk = require'which-key'
local keymap_opts = {noremap = true, silent = true}

M.keymap = function(mode, kb, cmd, desc)
    vim.keymap.set(mode, kb, cmd, keymap_opts)
    if desc then
        M.wk.register({
            [kb] = {desc}
        }, { mode = mode })
    end
end
M.vkeymap  = function(...) M.keymap('v', ...) end
M.ikeymap  = function(...) M.keymap('i', ...) end
M.nkeymap  = function(...) M.keymap('n', ...) end
M.tkeymap  = function(...) M.keymap('t', ...) end
M.inkeymap = function(...) M.ikeymap(...) M.nkeymap(...) end

M.create_bufkeymapper = function(bufnr)
    local bm = {}
    local buf_km_opts = vim.tbl_deep_extend(
        'force', keymap_opts, {buffer = bufnr}
    )
    bm.keymap = function (mode, kb, cmd, desc)
        vim.keymap.set(mode, kb, cmd, buf_km_opts)
        if desc then
            M.wk.register({
                [kb] = {desc}
            }, { mode = mode, buffer = bufnr })
        end
    end
    bm.vkeymap  = function(...) bm.keymap('v', ...) end
    bm.ikeymap  = function(...) bm.keymap('i', ...) end
    bm.nkeymap  = function(...) bm.keymap('n', ...) end
    bm.tkeymap  = function(...) bm.keymap('t', ...) end
    bm.inkeymap = function(...) bm.ikeymap(...) bm.nkeymap(...) end
    return bm
end

return M
