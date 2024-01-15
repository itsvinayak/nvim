local dap = require("dap")
local dapui = require("dapui")

local function configure()
    local dap_breakpoint = {
        breakpoint = {
            text = "",
            texthl = "LspDiagnosticsSignError",
            linehl = "",
            numhl = "",
        },
        rejected = {
            text = "",
            texthl = "LspDiagnosticsSignHint",
            linehl = "",
            numhl = "",
        },
        stopped = {
            text = "",
            texthl = "LspDiagnosticsSignInformation",
            linehl = "DiagnosticUnderlineInfo",
            numhl = "LspDiagnosticsSignInformation",
        },
    }

    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
    require("nvim-dap-virtual-text").setup {
        commented = true,
    }

    dapui.setup {} -- use default

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

local function configure_debuggers()
    -- Import debugger
    require("plugin.dap.javascript").setup() -- Adjust this path
end

function dapConfigMap()
    configure()           -- Configuration
    configure_exts()      -- Extensions
    configure_debuggers() -- Debugger
    -- Set up keymaps here
    vim.api.nvim_set_keymap('n', '<leader>ui', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
end

dapConfigMap()

-- Additional setup for dapui
dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
