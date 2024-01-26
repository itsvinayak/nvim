vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- General mappings
vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", opts)
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)

-- Tab navigation
vim.api.nvim_set_keymap("n", "<C-TAB>", "<Cmd>BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<TAB>", "<Cmd>BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-w>", "<Cmd>BufferClose<CR>", opts)

-- Miscellaneous mappings
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', opts)
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', opts)
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', opts)
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', opts)
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)
vim.api.nvim_set_keymap("n", "Q", "<nop>", opts)
vim.api.nvim_set_keymap("n", ":Q", ":q!", opts)
vim.api.nvim_set_keymap("n", ":W", ":w!", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<Cmd>nohlsearch<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>cnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>cprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>k", "<Cmd>lnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<Cmd>lprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]", opts)
vim.api.nvim_set_keymap("n", "<leader>x", "<Cmd>!chmod +x %<CR>", opts)

-- Reload config mapping
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

debugKeyMapping.setup()

