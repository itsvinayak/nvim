local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/site/pack/packer/opt/vscode-js-debug"
print(DEBUGGER_PATH)

-- setup 

local jsDap = {}

function jsDap.setup()
    -- setup adapters
    require('dap-vscode-js').setup({
        node_path = "node",
        debugger_path = DEBUGGER_PATH,
        debugger_cmd = {'js-debug-adapter'},
        adapters = {'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'}
    })

    -- custom adapter for running tasks before starting debug
    local custom_adapter = 'pwa-node-custom'
    dap.adapters[custom_adapter] = function(cb, config)
        if config.preLaunchTask then
            local async = require('plenary.async')
            local notify = require('notify').async

            async.run(function()
                ---@diagnostic disable-next-line: missing-parameter
                notify('Running [' .. config.preLaunchTask .. ']').events.close()
            end, function()
                vim.fn.system(config.preLaunchTask)
                config.type = 'pwa-node'
                dap.run(config)
            end)
        end
    end

    local dap = require('dap')

    -- language config
    for _, language in ipairs({'typescript', 'javascript'}) do
        dap.configurations[language] = {{
            name = 'Launch',
            type = 'pwa-node',
            request = 'launch',
            program = '${file}',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = {'<node_internals>/**'},
            protocol = 'inspector',
            console = 'integratedTerminal'
        }, {
            name = 'Attach to node process',
            type = 'pwa-node',
            request = 'attach',
            rootPath = '${workspaceFolder}',
            processId = require('dap.utils').pick_process
        }, {
            name = 'Debug Main Process (Electron)',
            type = 'pwa-node',
            request = 'launch',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {'${workspaceFolder}/dist/index.js'},
            outFiles = {'${workspaceFolder}/dist/*.js'},
            resolveSourceMapLocations = {'${workspaceFolder}/dist/**/*.js', '${workspaceFolder}/dist/*.js'},
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = {'<node_internals>/**'},
            protocol = 'inspector',
            console = 'integratedTerminal'
        }, {
            name = 'Compile & Debug Main Process (Electron)',
            type = custom_adapter,
            request = 'launch',
            preLaunchTask = 'npm run build-ts',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {'${workspaceFolder}/dist/index.js'},
            outFiles = {'${workspaceFolder}/dist/*.js'},
            resolveSourceMapLocations = {'${workspaceFolder}/dist/**/*.js', '${workspaceFolder}/dist/*.js'},
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = {'<node_internals>/**'},
            protocol = 'inspector',
            console = 'integratedTerminal'
        }}
    end
end


return jsDap