local M = {}

local PREFERENCES_FILE = vim.fn.expand(
    vim.fn.stdpath'config' .. '/org.gabmus.nvpunk.preferences.json'
)

local DEFAULT_PREFERENCES = {
    theme = 'onedark_warmer',
    greeter = 'punk',
}

--- Verify that the conf is valid and has all keys
---@param conf table
local function conf_valid(conf)
    if
        vim.fn.has_key(conf, 'theme') == 1 and
        vim.fn.has_key(conf, 'greeter') == 1
    then
        return true
    end
    return false
end

--- Save conf to PREFERENCES_FILE
---@param conf table
local function save_conf(conf)
    vim.fn.writefile({vim.json.encode(conf)}, PREFERENCES_FILE)
end

local function load_conf()
    if vim.fn.filereadable(PREFERENCES_FILE) == 1 then
        local conf = vim.json.decode(table.concat(vim.fn.readfile(PREFERENCES_FILE), '\n'))
        if conf_valid(conf) then
            return conf
        end
    end
    return DEFAULT_PREFERENCES
end

--- Save theme to PREFERENCES_FILE
---@param theme string
M.set_theme = function(theme)
    local conf = load_conf()
    conf.theme = theme
    save_conf(conf)
end

M.get_theme = function()
    return load_conf().theme
end

M.set_greeter = function(greeter)
    local conf = load_conf()
    conf.greeter = greeter
    save_conf(conf)
end

M.get_greeter = function()
    return load_conf().greeter
end

local preferences_menus = {
    {
        label = '  Change Theme',
        func = function()
            require'nvpunk.theme_manager.theme_chooser'.change_theme()
        end
    },
    {
        label = 'שּ  Change Greeter Header',
        func = function()
            vim.ui.select(
                require'nvpunk.plugins_conf.headers'.headers,
                {
                    prompt = 'Choose a header:',
                },
                function(greeter, _)
                    M.set_greeter(greeter)
                    vim.notify(
                        'Changes will be effective from the next restart',
                        'info', {title = 'nvpunk.preferences'}
                    )
                end
            )
        end
    },
    {
        label = '  Open Config',
        func = function()
            local changedir = 'cd ' .. vim.fn.stdpath'config'
            vim.cmd(changedir)
            vim.cmd[[NvimTreeOpen]]
        end
    },
}

M.preferences_menu = function()
    vim.ui.select(
        preferences_menus,
        {
            prompt = 'Preferences:',
            format_item = function(item)
                return item.label
            end
        },
        function(item, _)
            item.func()
        end
    )
end

vim.api.nvim_create_user_command(
    'NvpunkPreferences', function(_) M.preferences_menu() end,
    { nargs = 0 }
)

return M
