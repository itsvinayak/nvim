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
vim.api.nvim_set_keymap("n", "<C-TAB>", "<Cmd>tabPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<TAB>", "<Cmd>tabNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>tabnew<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-w>", "<Cmd>tabClose<CR>", opts)

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
vim.api.nvim_set_keymap("n", "<leader>k", "<Cmd>rlnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<Cmd>lprev<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]", opts)
vim.api.nvim_set_keymap("n", "<leader>x", "<Cmd>!chmod +x %<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nt", "<Cmd>Neotree toggle<CR>", opts)

-- Reload config mapping
function keymap_function()
    print("Reloading config !!")
    vim.cmd("so")
end

vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua keymap_function()<CR>", opts)


return {}
