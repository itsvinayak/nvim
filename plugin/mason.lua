return {
    {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
       require'lspconfig'.pyright.setup{}
       require'lspconfig'.tsserver.setup{}
    end,
}
}
