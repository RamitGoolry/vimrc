-- my shortcut for emmet
vim.g.user_emmet_leader_key='<C-Z>'
vim.api.nvim_set_keymap(
    'i', '<A-c>', '<C-Z>,', {silent = true}
)
