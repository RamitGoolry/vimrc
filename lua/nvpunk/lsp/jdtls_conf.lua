local M = {}

M.start_jdtls = function()
    local home = vim.fn.getenv('HOME')
    local jdtls_install = home .. '/.local/share/nvim/mason/packages/jdtls'
    local projname = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace = home .. '/.cache/nvim/nvpunk-jdtls-workspace/' .. projname
    local jdtls = require'jdtls'
    local jdtls_setup = require'jdtls.setup'

    local java_debug_path = home .. '/.local/share/nvim/java-debug'
    local vscode_java_test_path = home .. '/.local/share/nvim/vscode-java-test'

    if vim.fn.isdirectory(java_debug_path) == 0 then
        local Job = require'plenary.job'
        vim.notify('Installing java-debug')
        Job:new({
            command = '/usr/bin/git',
            args = {
                'clone',
                'https://github.com/microsoft/java-debug',
                java_debug_path
            },
            on_exit = function (_, ret)
                if ret == 0 then
                    Job:new({
                        command = java_debug_path .. '/mvnw',
                        args = { 'clean', 'install' },
                        cwd = java_debug_path,
                        on_exit = function (_, ret1)
                            if ret1 == 0 then
                                vim.schedule(function()
                                    M.start_jdtls()
                                end)
                            else
                                vim.notify('Failed to install java-debug', 'error')
                            end
                        end
                    }):start()
                else
                    vim.notify('Failed to clone java-debug', 'error')
                end
            end
        }):start()
        return
    end

    if vim.fn.isdirectory(vscode_java_test_path) == 0 then
        local Job = require'plenary.job'
        vim.notify('Installing vscode-java-test')
        Job:new({
            command = '/usr/bin/git',
            args = {
                'clone',
                'https://github.com/microsoft/vscode-java-test',
                vscode_java_test_path
            },
            on_exit = function (_, ret)
                if ret == 0 then
                    Job:new({
                        command = 'npm',
                        args = { 'install' },
                        cwd = vscode_java_test_path,
                        on_exit = function (_, ret1)
                            if ret1 == 0 then
                                Job:new({
                                    command = 'npm',
                                    args = { 'run', 'build-plugin' },
                                    cwd = vscode_java_test_path,
                                    on_exit = function (_, ret2)
                                        if ret2 == 0 then
                                            vim.schedule(function()
                                                M.start_jdtls()
                                            end)
                                        else
                                            vim.notify('Failed to build vscode-java-test')
                                        end
                                    end
                                }):start()
                            else
                                vim.notify('Failed to get deps for vscode-java-test', 'error')
                            end
                        end
                    }):start()
                else
                    vim.notify('Failed to clone vscode-java-test', 'error')
                end
            end
        }):start()
        return
    end

    local bundles = {
        vim.fn.glob(java_debug_path .. '/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar')
    }
    vim.list_extend(
        bundles,
        vim.split(vim.fn.glob(vscode_java_test_path .. '/server/*.jar'), '\n')
    )


    local extendedClientCapabilities =  jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {

            'java', -- or '/path/to/java11_or_newer/bin/java'
                    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            '-jar', jdtls_install .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

            '-configuration', jdtls_install .. '/config_linux',

            -- See `data directory configuration` section in the README
            '-data', workspace
        },

        -- 💀
        -- This is the default if not provided, you can remove it. Or adjust as needed.
        -- One dedicated LSP server & client will be started per unique root_dir
        root_dir = jdtls_setup.find_root({'.git', 'mvnw', 'gradlew'}),

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
            },
            extendedClientCapabilities = extendedClientCapabilities
        },

        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
            bundles = bundles
        },

        on_attach = function(client, bufnr)
            require'nvpunk.lsp.keymaps'.set_lsp_keymaps(client, bufnr)
            local km = require'nvpunk.util.keymapper'
            local bm = km.create_bufkeymapper(bufnr)
            bm.nkeymap('<leaeder>bjr', '<cmd>JdtRefreshDebugConfigs<cr>', 'Refresh Java Debugger Conf')
            bm.nkeymap('<leaeder>bjc', '<cmd>lua require"jdtls".test_class()<cr>', 'Test Class')
            bm.nkeymap('<leaeder>bjn', '<cmd>lua require"jdtls".test_nearest_method()<cr>', 'Test Nearest Method')
            require'jdtls'.setup_dap({hotcodereplace = 'auto'})
            require'jdtls.dap'.setup_dap_main_class_configs()
        end,
        capabilities = require'nvpunk.lsp.capabilities'.capabilities,
    }

    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach(config)
end

return M
