return {
    -- Render markdown (headings, code blocks, tables, checkboxes) in-buffer
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>tr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown [R]endering" },
        },
        opts = {
            render_modes = { "n", "c", "t" },
        },
    },
}
