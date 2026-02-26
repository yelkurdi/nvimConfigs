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

-- Jump to end of current indentation block (Python)
vim.keymap.set('n', ']i', function()
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    local line = vim.fn.line('.')
    local last_line = vim.fn.line('$')

    -- Move to next line
    line = line + 1
    while line <= last_line do
        local indent = vim.fn.indent(line)
        local is_blank = vim.fn.getline(line):match('^%s*$')

        -- If we find a line with same or less indentation (and it's not blank), we've reached the end
        if not is_blank and indent <= current_indent then
            vim.fn.cursor(line - 1, 1)
            return
        end
        line = line + 1
    end

    -- If we reach the end of file, go to last line
    vim.fn.cursor(last_line, 1)
end, { desc = "Jump to end of indentation block" })

-- Jump to start of current indentation block
vim.keymap.set('n', '[i', function()
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    local line = vim.fn.line('.') - 1

    -- Move to previous line
    while line >= 1 do
        local indent = vim.fn.indent(line)
        local is_blank = vim.fn.getline(line):match('^%s*$')

        -- If we find a line with less indentation (and it's not blank), we've found the parent block
        if not is_blank and indent < current_indent then
            vim.fn.cursor(line, 1)
            return
        end
        line = line - 1
    end

    -- If we reach the start of file, go to first line
    vim.fn.cursor(1, 1)
end, { desc = "Jump to start of indentation block" })
