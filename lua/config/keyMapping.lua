vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- tab navigation
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Debugging: move to previous/next
map('n', '<C-TAB>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<TAB>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-n>', '<Cmd>tabnew<CR>', opts)
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)

-- vim.api.nvim_set_keymap("n", "<leader>key", function()
--     require("file").function()
-- end, opts)

vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', opts)
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', opts)
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', opts)
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', opts)

-- This will bring back to normal mode
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)

vim.api.nvim_set_keymap("n", "Q", "<nop>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)




vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]", opts)

vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

function keymap_function()
    print("Reloading config !!")
    vim.cmd("so")
end

vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua keymap_function()<CR>", opts)

-- Debugging
local debugKeyMapping = {}

local whichkey = require "which-key"

function debugKeyMapping.setup()
    local keymap = {
        d = {
            name = "Debug",
            R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
            E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
            C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
            U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
            b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
            d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
            e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
            g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
            h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
            S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
            i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
            o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
            p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
            q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
            r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
            t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
            u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" }
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
            e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" }
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

return debugKeyMapping
