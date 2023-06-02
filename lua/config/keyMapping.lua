vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- tab navigation
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- debugKeyMappingove to previous/next
map('n', '<C-TAB>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<TAB>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<C-n>', '<Cmd>tabnew<CR>', opts)
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)

-- vim.keymap.set("n", "<leader>key", function()
-- require("file).function()
-- end)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This will bring back to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- debugging
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
            u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        },
    }

    whichkey.register(keymap, {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    })

    local keymap_v = {
        d = {
            name = "Debug",
            e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
        },
    }
    whichkey.register(keymap_v, {
        mode = "v",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    })
end

return debugKeyMapping
