return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            -- load the theme without affecting devicon colors.
            vim.cmd.colorscheme "vscode"
            local c = require('vscode.colors').get_colors()
            local mycolors = {} ---@type table<string,string>
            if vim.o.background == 'dark' then
                mycolors = {
                    -- normalBack = '#1F1F1F',
                    Normal_bg = '#121212',
                    FloatBorder_fg = '#3069BF',
                    FloatBorder_bg = '#121212',
                    NormalNC_bg = '#2E2D2D',
                }
            else
                mycolors = {
                    normalBack = '#FFFFFF',
                    NormalNC_bg = '#2E2D2D',
                }
            end

            require('vscode').setup({

                -- Color picker: https://htmlcolorcodes.com/color-picker/
                -- My midifications
                vim.api.nvim_set_hl(0, 'Normal', { bg = mycolors.Normal_bg }),
                -- None-focus split
                vim.api.nvim_set_hl(0, 'NormalNC', { bg = mycolors.NormalNC_bg }),

                -- cursor highlight color set to none-focus so that it disapear when out of focus
                vim.api.nvim_set_hl(0, "CursorLine", { bg = mycolors.NormalNC_bg}),

                -- Set background of Telescope window
                vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = mycolors.Normal_bg }),
                -- Set foreground (color of border characters) and background of border
                vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = mycolors.FloatBorder_fg, bg = mycolors.FloatBorder_bg }),
                -- Set background of generic float window
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = mycolors.Normal_bg }),
                -- Set foreground and background of generic float border
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = mycolors.FloatBorder_fg, bg = mycolors.FloatBorder_bg }),

                -- Alternatively set style in setup
                -- style = 'light'

                -- Enable transparent background
                transparent = true,

                -- Enable italic comment
                italic_comments = true,

                -- Enable italic inlay type hints
                italic_inlayhints = true,

                -- Underline `@markup.link.*` variants
                underline_links = true,

                -- Disable nvim-tree background color
                disable_nvimtree_bg = true,

                -- Apply theme colors to terminal
                terminal_colors = true,

                -- Override colors (see ./lua/vscode/colors.lua)
                color_overrides = {
                    vscLineNumber = '#FFFFFF',
                },

                -- Override highlight groups (see ./lua/vscode/theme.lua)
                group_overrides = {
                    -- this supports the same val table as vim.api.nvim_set_hl
                    -- use colors from this colorscheme by requiring vscode.colors!
                    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
                }
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'vscode',
        }
    }
}

-- return {
--     {
--         "folke/tokyonight.nvim",
--         config = function()
--
--             -- Color picker: https://htmlcolorcodes.com/color-picker/
--
--             vim.cmd.colorscheme "tokyonight"
--
--             vim.api.nvim_set_hl(0, 'Normal', { bg = '#00044F' })
--
--             -- Grey for general line numbers
--             vim.api.nvim_set_hl(0, "LineNr", { fg = "#808086" })
--
--             -- Set the background and foreground of the hover window content
--             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#20195E" })
--
--             -- Set the background and foreground of the hover window border
--             -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#4F002B" })
--         end
--     },
--     {
--         "nvim-lualine/lualine.nvim",
--         dependencies = {
--             "nvim-tree/nvim-web-devicons",
--         },
--         opts = {
--             theme = 'tokyonight',
--         }
--     }
-- }
