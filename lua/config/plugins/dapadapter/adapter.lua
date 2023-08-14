M = {
    delve = function (dap)
        dap.adapters.delve = {
            type = 'server',
            port = '${port}',
            executable = {
                  command = 'dlv',
                  args = {'dap', '-l', '127.0.0.1:${port}'},
            },
            options = {
                initialize_timeout_sec = 60
            }
        }
    end
}

return M

