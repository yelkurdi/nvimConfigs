return {
    "dhruvasagar/vim-table-mode",
    -- Globals must be set in `init` (before the plugin loads) so the derived
    -- mappings pick them up.
    init = function()
        vim.g.table_mode_corner = "|"
        -- Default prefix is <leader>t, which collides with the [T]oggle namespace
        -- (e.g. table-mode's buffer-local <leader>tr realign shadows render-markdown's toggle).
        vim.g.table_mode_map_prefix = "<leader>T"
    end,
}
