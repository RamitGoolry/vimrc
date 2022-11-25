local M = {}

local PREFERENCES_FILE = vim.fn.expand(
    vim.fn.stdpath'config' .. '/org.gabmus.nvpunk.preferences.json'
)

local DEFAULT_PREFERENCES = {
    theme = 'onedark_warmer',
    greeter = 'punk',
    indent_blankline_enabled = true,
    tab_style = 'slant',
    navic_enabled = true,
    statusline_style = 'plain',
}

--- Make sure that conf has all keys
---@param conf table
---@return table
local function replace_missing_confs(conf)
    for k, v in pairs(DEFAULT_PREFERENCES) do
        if vim.fn.has_key(conf, k) == 0 then
            conf[k] = v
        end
    end
    return conf
end

--- Save conf to PREFERENCES_FILE
---@param conf table
local function save_conf(conf)
    vim.fn.writefile({vim.json.encode(conf)}, PREFERENCES_FILE)
end

local function load_conf()
    if vim.fn.filereadable(PREFERENCES_FILE) == 1 then
        local conf = vim.json.decode(table.concat(vim.fn.readfile(PREFERENCES_FILE), '\n'))
        return replace_missing_confs(conf)
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

---@return boolean
M.get_indent_blankline_enabled = function()
    return load_conf().indent_blankline_enabled
end

---@param nval boolean
M.set_indent_blankline_enabled = function(nval)
    local conf = load_conf()
    conf.indent_blankline_enabled = nval
    save_conf(conf)
    reload'nvpunk.plugins_conf.indent_blankline_conf'
end

---@return boolean
M.get_navic_enabled = function()
    return load_conf().navic_enabled
end

---@param nval boolean
M.set_navic_enabled = function(nval)
    local conf = load_conf()
    conf.navic_enabled = nval
    save_conf(conf)
    reload'nvpunk.plugins_conf.navic_conf'
end

---@return 'slant' | 'padded_slant' | 'thin' | 'thick'
M.get_tab_style = function()
    return load_conf().tab_style
end

---Set tab style
---@param style 'slant' | 'padded_slant' | 'thin' | 'thick'
M.set_tab_style = function(style)
    local conf = load_conf()
    conf.tab_style = style
    save_conf(conf)
    reload'nvpunk.plugins_conf.bufferline_conf'
end

---@return 'powerline' | 'plain' | 'plain_separators' | 'slant_low' |
---        'slant_high' | 'round' | 'pixel'
M.get_statusline_style = function()
    return load_conf().statusline_style
end

---@param style 'powerline' | 'plain' | 'plain_separators' | 'slant_low' |
---             'slant_high' | 'round' | 'pixel'
M.set_statusline_style = function(style)
    local conf = load_conf()
    conf.statusline_style = style
    save_conf(conf)
    reload('nvpunk.theme_manager.themes.' .. M.get_theme())
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
                    reload('nvpunk.plugins_conf.alpha_conf')
                end
            )
        end
    },
    {
        label = '  Interface Preferences',
        func = function()
            local blankline_enabled = M.get_indent_blankline_enabled()
            local navic_enabled = M.get_navic_enabled()
            vim.ui.select(
                {
                    {
                        label = '  '..
                                (blankline_enabled and 'Disable' or 'Enable') ..
                                ' Indent Blankline',
                        func = function()
                            if blankline_enabled then
                                M.set_indent_blankline_enabled(false)
                                vim.schedule(function()
                                    vim.cmd'IndentBlanklineDisable!'
                                end)
                            else
                                M.set_indent_blankline_enabled(true)
                                vim.schedule(function()
                                    vim.cmd'IndentBlanklineEnable!'
                                end)
                            end
                        end
                    },
                    {
                        label = '  '..
                                (navic_enabled and 'Disable' or 'Enable') ..
                                ' Navic (breadcrumbs)',
                        func = function()
                            if navic_enabled then
                                M.set_navic_enabled(false)
                            else
                                M.set_navic_enabled(true)
                            end
                        end
                    },
                    {
                        label = '裡 Tab Style',
                        func = function ()
                            vim.ui.select(
                                {
                                    {label = 'Slant', value = 'slant'},
                                    {label = 'Padded Slant', value = 'padded_slant'},
                                    {label = 'Thin', value = 'thin'},
                                    {label = 'Thick', value = 'thick'},
                                },
                                {
                                    prompt = 'Tab Style:',
                                    format_item = function(item) return item.label end
                                },
                                function(item, _) M.set_tab_style(item.value) end
                            )
                        end
                    },
                    {
                        label = '  Statusline Style',
                        func = function ()
                            vim.ui.select(
                                {
                                    {label = 'Powerline', value = 'powerline'},
                                    {label = 'Plain', value = 'plain'},
                                    {label = 'Plain with Separators', value = 'plain_separators'},
                                    {label = 'Slant Low', value = 'slant_low'},
                                    {label = 'Slant High', value = 'slant_high'},
                                    {label = 'Round', value = 'round'},
                                    {label = 'Pixel', value = 'pixel'},
                                },
                                {
                                    prompt = 'Statusline Style:',
                                    format_item = function(item) return item.label end
                                },
                                function(item, _) M.set_statusline_style(item.value) end
                            )
                        end
                    },
                },
                {
                    prompt = 'Interface Preferences:',
                    format_item = function(item) return item.label end
                },
                function(item, _) item.func() end
            )
        end
    },
    {
        label = '  Open Config',
        func = function()
            vim.cmd('cd ' .. vim.fn.stdpath'config')
            vim.cmd'NvpunkExplorerOpen'
        end
    },
}

M.preferences_menu = function()
    vim.ui.select(
        preferences_menus,
        {
            prompt = 'Preferences:',
            format_item = function(item) return item.label end
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
