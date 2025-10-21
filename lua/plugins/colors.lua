return {
    {
        "folke/tokyonight.nvim",
        config = function()

            -- Color picker: https://htmlcolorcodes.com/color-picker/

            vim.cmd.colorscheme "tokyonight"

            vim.api.nvim_set_hl(0, 'Normal', { bg = '#00044F' })

            -- Grey for general line numbers
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#808086" })

            -- Set the background and foreground of the hover window content
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#20195E" })

            -- Set the background and foreground of the hover window border
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#4F002B" })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'tokyonight',
        }
    }
}
