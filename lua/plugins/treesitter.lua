return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")
            ---@diagnostic disable-next-line: missing-fields
            configs.setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
                },
                -- enable syntax highlighting
                highlight = { enable = true },
                 -- Enable Treesitter folding
                folds = { enable = true },
                -- enable indentation
                indent = { enable = true },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = { enable = true },
                -- ensure these language parsers are installed
                ensure_installed = {
                    "python",
                    "lua",
                    "luadoc",
                    "json",
                    "yaml",
                    "java",
                    "javascript",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "vimdoc",
                    "bash",
                    "diff",
                    "typescript",
                    "c",
                    "cmake",
                    "css",
                    "cpp",
                    "cuda",
                    "git_config",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                    "gnuplot",
                    "go",
                    "html",
                },
                -- auto install above language parsers
                auto_install = false,
            })
        end
    }
}
