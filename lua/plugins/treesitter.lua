return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({})
            -- ensure these language parsers are installed (no-op if already present)
            ts.install({
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
            })

            -- enable highlighting and indentation for buffers that have a parser
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })

            require("nvim-treesitter-textobjects").setup({ select = { lookahead = true } })
            local select = require("nvim-treesitter-textobjects.select")
            for lhs, query in pairs({ af = "@function.outer", ["if"] = "@function.inner" }) do
                vim.keymap.set({ "x", "o" }, lhs, function()
                    select.select_textobject(query, "textobjects")
                end)
            end
        end
    }
}
