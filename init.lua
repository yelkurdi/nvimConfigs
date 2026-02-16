-- Keybinds
if vim.loader then
    vim.loader.enable()
end
-- Bluevela specific
local home = os.getenv("HOME")
if home and home:find("/u/yelkurdi", 1, true) then
    -- This runs only when on the cluster
    vim.g.python3_host_prog = '/u/yelkurdi/.local/share/nvim/runtime/autoload/provider/python3.vim'
end
require('config.options')
require('config.keybinds')
require('config.lazy')

