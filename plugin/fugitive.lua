function gitStatus ()
    vim.fn.system("git status")
end


vim.api.nvim_set_keymap("n", "<leader>gs", "<Cmd>gitStatus<CR>",{ noremap = true, silent = true })



local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = fugitive_plugin_g,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        -- Push
        vim.api.nvim_set_keymap("n", "<leader>p", function()
            vim.fn.system("Git push")
        end, opts)

        -- Pull with rebase
        vim.api.nvim_set_keymap("n", "<leader>P", function()
            vim.fn.system("Git pull --rebase")
        end, opts)

        -- Custom Git push with tracking
        vim.api.nvim_set_keymap("n", "<leader>t", ":Git push -u origin ", opts)
    end
})
