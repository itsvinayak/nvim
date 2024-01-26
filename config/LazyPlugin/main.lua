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
require("lazy").setup({require("plugin.ui"), require("plugin.utils")});
