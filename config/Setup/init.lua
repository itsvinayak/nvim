-- hidding tmux status line
vim.cmd([[
  augroup DisableTmuxStatus
    autocmd!
    autocmd VimEnter,VimLeave * silent !tmux set status off
  augroup END
]])



local augroup = vim.api.nvim_create_augroup
local luaNvimGroup = augroup('luaNvim', {})
local luaNvimFormatGroup = augroup('luaNvim', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- auto format on save
autocmd({ "BufWritePre" }, {
    group = luaNvimFormatGroup,
    pattern = "*",
    command = [[lua vim.lsp.buf.format()]],
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = luaNvimGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.reload_config_on_save = false
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- horizontal line
vim.opt.cursorline = true

vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.autowrite = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 500
-- filetype plugin on
vim.opt.mouse = "a"
vim.cmd("filetype plugin on")
vim.cmd("syntax on")



return {}
