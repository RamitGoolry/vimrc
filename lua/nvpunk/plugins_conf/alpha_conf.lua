local dashboard = require'alpha.themes.dashboard'

local header = require'nvpunk.plugins_conf.headers'.images[
    require'nvpunk.preferences'.get_greeter()
]

dashboard.section.header.val = header.content
dashboard.section.header.opts.hl = header.hl

dashboard.section.buttons.val = {
    dashboard.button(
        'tf',
        '  Find file',
        ':lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'
    ),
    dashboard.button(
        'ge',
        '  Open explorer',
        ':NvimTreeOpen<CR>'
    ),
    dashboard.button(
        'tg',
        '  Find word',
        ':Telescope live_grep<CR>'
    ),
    dashboard.button(
        'tr',
        '  Recent files',
        ':lua require"telescope.builtin".oldfiles(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'
    ),
    dashboard.button(
        'C',
        '  Preferences',
        ':lua require"nvpunk.preferences".preferences_menu()<CR>'
    ),
    dashboard.button(
        'q',
        '  Quit',
        ':qa<CR>'
    ),
}
dashboard.section.buttons.opts.spacing = 0
require'alpha'.setup(dashboard.opts)
