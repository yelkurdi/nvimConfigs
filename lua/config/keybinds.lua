vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- folding
vim.api.nvim_set_keymap('n', '<space><space>', 'za', { noremap = true, silent = true })
