return {
    "alexghergh/nvim-tmux-navigation",
    config = function()
        require("nvim-tmux-navigation").setup({
            disable_when_zoomed = true, -- Optional: Disable navigation when Tmux pane is zoomed
        })
    end,
    keys = {
        {
            "<C-h>",
            function()
                require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
            end,
            mode = { "n" },
            desc = "Tmux/Nvim navigate left",
        },
        {
            "<C-j>",
            function()
                require("nvim-tmux-navigation").NvimTmuxNavigateDown()
            end,
            mode = { "n" },
            desc = "Tmux/Nvim navigate down",
        },
        {
            "<C-k>",
            function()
                require("nvim-tmux-navigation").NvimTmuxNavigateUp()
            end,
            mode = { "n" },
            desc = "Tmux/Nvim navigate up",
        },
        {
            "<C-l>",
            function()
                require("nvim-tmux-navigation").NvimTmuxNavigateRight()
            end,
            mode = { "n" },
            desc = "Tmux/Nvim navigate right",
        },
        {
            "<C-\\>",
            function()
                require("nvim-tmux-navigation").NvimTmuxNavigatePrevious()
            end,
            mode = { "n" },
            desc = "Tmux/Nvim navigate previous",
        },
    },
}

