return {
    {'mfussenegger/nvim-dap'},
    {'rcarriga/nvim-dap-ui'},
    {
      'leoluz/nvim-dap-go',
      config = function()                   -- TODO: move config to its own file (https://github.com/leoluz/nvim-dap-go)
        local dap_go = require('dap-go')
        dap_go.setup()
      end
    },
}
