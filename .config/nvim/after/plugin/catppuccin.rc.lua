vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
    integrations = {
        treesitter = true,
        cmp = true,
        telescope = true,
        bufferline = true,
    },
})

vim.cmd [[colorscheme catppuccin]]
