local Job = require'plenary.job'
local lines = {}
local BUFNAME = 'NvpunkHealthcheck'

local HEADER_HL = 'NvpunkHealthcheckHeader'
local GOOD_HL   = 'NvpunkHealthcheckGood'
local BAD_HL    = 'NvpunkHealthcheckBad'

local function def_hl()
    vim.api.nvim_set_hl(0, HEADER_HL, {
        bg = '#f6c177',
        fg = '#191724',
        bold = true,
    })
    vim.api.nvim_set_hl(0, GOOD_HL, {
        fg = '#a6d189',
    })
    vim.api.nvim_set_hl(0, BAD_HL, {
        fg = '#eb6f92',
    })
end

--- Test if a system command is callable
---@param cmd string
---@param on_success function
---@param on_fail function
local function test_command(cmd, on_success, on_fail)
    Job:new({
        command = 'which',
        args = {cmd},
        on_exit = function(_, ret)
            if ret == 0 then
                vim.schedule(on_success)
            else
                vim.schedule(on_fail)
            end
        end
    }):start()
end

local Float = require'nvpunk.util.float'

--- Show message in healthcheck window. Upon activation it opens the given
--- help page
---@param message string
---@param ok boolean
---@param help_page string
local function msg(message, ok, help_page)
    local hl = BAD_HL
    if ok then hl = GOOD_HL end
    table.insert(lines, {
        message = message,
        hl = hl,
        cmd = function()
            Float.close_win(BUFNAME)
            vim.cmd('h ' .. help_page .. '')
        end
    })
    Float.draw(BUFNAME, lines)
end

---@param message string
---@param help_page string
local function msg_success(message, help_page)
    msg('      ' .. message, true, help_page)
end
--
---@param message string
---@param help_page string
local function msg_fail(message, help_page)
    msg('      ' .. message, false, help_page)
end

local function test_and_log(cmd, message, help_page)
    test_command(
        cmd,
        function() msg_success(message, help_page) end,
        function() msg_fail(message, help_page) end
    )
end

return function()
    def_hl()
    lines = {}
    table.insert(lines, {message = ''})
    table.insert(lines, {message = '                                      ', hl = HEADER_HL})
    table.insert(lines, {message = '                Nvpunk Health Check   ', hl = HEADER_HL})
    table.insert(lines, {message = '                                      ', hl = HEADER_HL})
    table.insert(lines, {message = ''})
    table.insert(lines, {message = '        q, <esc>  -  Quit', hl = 'Comment'})
    table.insert(lines, {message = '        <cr>      -  Open help page', hl = 'Comment'})
    table.insert(lines, {message = ''})
    table.insert(lines, {message = ''})
    Float.create_win(BUFNAME)
    test_and_log('git', '[git] Git version control', 'nvpunk-deps-git')
    test_and_log('npm', '[npm] Node Package Manager', 'nvpunk-deps-npm')
    test_and_log('gcc', '[gcc] GNU Compiler Collection', 'nvpunk-deps-gcc')
    test_and_log('python3', '[python3] Python', 'nvpunk-deps-python')
    require'nvpunk.util.find_jdtls_java'(function(data)
        if data == nil or data == '' then
            msg_fail('[java17] Java 17+', 'nvpunk-deps-java17')
        else
            msg_success('[java17] Java 17+', 'nvpunk-deps-java17')
        end
    end)
    test_and_log('rg', '[rg] Ripgrep search tool', 'nvpunk-deps-rg')
end
