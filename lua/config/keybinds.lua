vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- folding
vim.api.nvim_set_keymap('n', '<space><space>', 'za', { noremap = true, silent = true })

-- Function to toggle all gutter columns at once
local function toggle_gutter()
    if vim.opt.number:get() or vim.opt.relativenumber:get() then
        -- Turn everything OFF
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        vim.opt.foldcolumn = "0"
        require("snacks").setup({
            Snacks.indent.disable()
        })
        print("Gutter Hidden")
    else
        -- Turn everything ON (Adjust these to your preferred defaults)
        vim.opt.number = true
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "yes"
        vim.opt.foldcolumn = "1"
        require("snacks").setup({
            Snacks.indent.enable()
        })
        print("Gutter Shown")
    end
end

-- Create the keymap
-- Use <leader>tg to trigger the function
vim.keymap.set('n', '<leader>tg', toggle_gutter, { desc = "Toggle Left Gutter (Numbers/Signs/Folds)" })

-- Terminal: open in bottom horizontal split
vim.keymap.set('n', '<leader>te', function()
    vim.cmd('botright split | terminal')
end, { desc = "Open terminal in bottom split" })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
