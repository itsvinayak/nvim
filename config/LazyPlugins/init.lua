if vim.fn.has("nvim-0.9.0") == 0 then
    vim.api.nvim_echo({{"LazyVim requires Neovim >= 0.9.0\n", "ErrorMsg"}, {"Press any key to exit", "MoreMsg"}}, true,
        {})
    vim.fn.getchar()
    vim.cmd([[quit]])
    return {}
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
-- ============================================================================
require("lazy").setup({
                require("plugin.ui"),
                require("plugin.utils"),
                require("plugin.mason"),
                require("plugin.linting"),
                require("plugin.conform"),
                require("plugin.cmp")
            });

-- Key mappings


local whichKeyMapping = {}

local whichkey = require "which-key"

function whichKeyMapping.setup()
    local keymap = {
        d = {
            name = "Debug",
            R = { "<Cmd>lua require'dap'.run_to_cursor()<CR>", "Run to Cursor" },
            E = { "<Cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>", "Evaluate Input" },
            C = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>", "Conditional Breakpoint" },
            U = { "<Cmd>lua require'dapui'.toggle()<CR>", "Toggle UI" },
            b = { "<Cmd>lua require'dap'.step_back()<CR>", "Step Back" },
            c = { "<Cmd>lua require'dap'.continue()<CR>", "Continue" },
            d = { "<Cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
            e = { "<Cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
            g = { "<Cmd>lua require'dap'.session()<CR>", "Get Session" },
            h = { "<Cmd>lua require'dap.ui.widgets'.hover()<CR>", "Hover Variables" },
            S = { "<Cmd>lua require'dap.ui.widgets'.scopes()<CR>", "Scopes" },
            i = { "<Cmd>lua require'dap'.step_into()<CR>", "Step Into" },
            o = { "<Cmd>lua require'dap'.step_over()<CR>", "Step Over" },
            p = { "<Cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
            q = { "<Cmd>lua require'dap'.close()<CR>", "Quit" },
            r = { "<Cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
            s = { "<Cmd>lua require'dap'.continue()<CR>", "Start" },
            t = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
            x = { "<Cmd>lua require'dap'.terminate()<CR>", "Terminate" },
            u = { "<Cmd>lua require'dap'.step_out()<CR>", "Step Out" }
        }
    }

    whichkey.register(keymap, {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    })

    local keymap_v = {
        d = {
            name = "Debug",
            e = { "<Cmd>lua require'dapui'.eval()<CR>", "Evaluate" }
        }
    }
    whichkey.register(keymap_v, {
        mode = "v",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false
    })
end

-- plugin config
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "tsserver", "jsonls", "mdx_analyzer", "pylsp", "sqlls", "yamlls", "dockerls", "bashls", "typos_lsp" },
    automatic_installation = true,
}
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
require("ufoConfig")


require("notify")("LazyVim: Loading plugins...", "info")
whichKeyMapping.setup()

return {}
