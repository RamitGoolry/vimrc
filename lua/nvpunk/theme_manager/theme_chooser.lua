local M = {}

local available_themes = {
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
    'rose_pine',
    'rose_pine_dawn',
    'rose_pine_moon',
    'tokyonight_day',
    'tokyonight_night',
    'tokyonight_storm',
    'tundra',
}

M.change_theme = function()
    vim.ui.select(
        available_themes,
        {
            prompt = 'Choose a theme:',
        },
        function(theme, _)
            reload(
                'nvpunk.theme_manager.themes.' .. theme
            )
            vim.notify('Switched to theme ' .. theme, 'info', {
                title = 'nvpunk.theme_manager.theme_chooser'
            })
            require'nvpunk.preferences'.set_theme(theme)
        end
    )
end

return M
