local M = {}

--- call a function; show a notification if it fails
-- @param func function
-- @param args table
-- @param err? string
-- @param context? string
-- @return nil
M.call = function(func, args, err, context)
    if err == nil then
        err = 'Failed to call function'
    end
    if context == nil then
        context = 'nvpunk.try.call'
    end
    local ok, _ = pcall(func, unpack(args))
    if not ok then
        vim.notify(err, 'error', {title = context})
    end
end

--- try to call require; show a notification if it fails
-- @param module string
-- @return nil
M.require = function(module)
    M.call(
        require,
        {module},
        'Failed to load module ' .. module,
        'nvpunk.try.require'
    )
end

return M
