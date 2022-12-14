local M = {}

local builtin_themes = {
    'barstrata',
    'catppuccin_frappe',
    'catppuccin_latte',
    'catppuccin_macchiato',
    'catppuccin_mocha',
    'doom_one',
    'dracula',
    'gruvbox_dark',
    'gruvbox_medium',
    'kanagawa',
    'mellow',
    'monokai',
    'monokai_pro',
    'monokai_ristretto',
    'monokai_soda',
    'moonlight',
    'nightfox_carbonfox',
    'nightfox_dawnfox',
    'nightfox_dayfox',
    'nightfox_duskfox',
    'nightfox_nightfox',
    'nightfox_nordfox',
    'nightfox_teraforx',
    'nord',
    'onedark_cool',
    'onedark_dark',
    'onedark_darker',
    'onedark_deep',
    'onedark_warm',
    'onedark_warmer',
    'oxocarbon',
    'rose_pine',
    'rose_pine_dawn',
    'rose_pine_moon',
    'sonokai',
    'tokyonight_day',
    'tokyonight_moon',
    'tokyonight_night',
    'tokyonight_storm',
    'tundra',
}

local user_func_themes = {}

M.available_themes = {unpack(builtin_themes)}
for k, v in pairs(require'nvpunk.util.user_conf'.user_themes()) do
    if type(k) == 'number' then
        table.insert(M.available_themes, v)
    elseif type(k) == 'string' and type(v) == 'function' then
        table.insert(M.available_themes, k)
        user_func_themes[k] = v
    end
end

---Load specified theme
---@param theme string
---@param notify? boolean = true
---@param save_pref? boolean = true
M.load_theme = function(theme, notify, save_pref)
    if notify == nil then notify = true end
    if save_pref == nil then save_pref = true end
    vim.cmd'colorscheme default'
    require'nvpunk.util.try'.load_theme(theme, function()
        if vim.tbl_contains(builtin_themes, theme) then
            reload(
                'nvpunk.theme_manager.themes.' .. theme
            )
        else
            if vim.tbl_contains(vim.tbl_keys(user_func_themes), theme) then
                user_func_themes[theme]()
            else
                vim.cmd('colorscheme ' .. theme)
            end
        end
        if notify then
            vim.notify('Switched to theme ' .. theme, 'info', {
                title = 'nvpunk.theme_manager.theme_chooser'
            })
        end
        if save_pref then
            require'nvpunk.preferences'.set_theme(theme)
        end
    end)
end

M.change_theme = function()
    vim.ui.select(
        M.available_themes,
        {
            prompt = 'Choose a theme:',
        },
        function(theme, _) M.load_theme(theme) end
    )
end

return M
