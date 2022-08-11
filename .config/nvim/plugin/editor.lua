local opt = vim.opt

vim.g.mapleader = " "
opt.mouse = "a"
opt.cursorline = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoread = true
opt.nu = true
opt.foldlevelstart = 99
opt.scrolloff = 10
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.wrap = false
opt.shell = 'fish'

local keymap = function(tbl)
    -- Some sane default options
    local opts = { noremap = true, silent = true }
    -- Dont want these named fields on the options table
    local mode = tbl['mode']
    tbl['mode'] = nil
    local bufnr = tbl['bufnr']
    tbl['bufnr'] = nil

    for k, v in pairs(tbl) do
        if tonumber(k) == nil then
            opts[k] = v
        end
    end


    if bufnr ~= nil then
        vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
    else
        vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
    end
end

local imap = function(tbl)
    tbl['mode'] = 'i'
    keymap(tbl)
end

local nmap = function(tbl)
    tbl['mode'] = 'n'
    keymap(tbl)
end

-- Keybinds
nmap { "<leader>bc", "<cmd>bd<cr>" }

require("telescope").setup { defaults = { file_ignore_patterns = { "node_modules" } } }
require("telescope").load_extension "file_browser"
-- Telescope
nmap { "<leader>ff", "<cmd>Telescope find_files<cr>" }
nmap { "<leader>fg", "<cmd>Telescope live_grep<cr>" }
nmap { "<leader>fb", "<cmd>Telescope buffers<cr>" }
nmap { "<leader>fe", "<cmd>Telescope file_browser<cr>" }
nmap { "<leader>fh", "<cmd>Telescope help_tags<cr>" }
