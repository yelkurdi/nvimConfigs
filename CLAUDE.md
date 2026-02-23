# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A modular Neovim configuration using **lazy.nvim** as the plugin manager. Primarily targeting Python development on macOS (with some remote cluster support). Adapted from tonybanters' configuration.

## Architecture

**Entry point:** `init.lua` loads three config modules in order: `config.options`, `config.keybinds`, `config.lazy`.

**Core config modules** (`lua/config/`):
- `options.lua` — Vim options (tabs=4, treesitter folding, persistent undo, dark theme)
- `keybinds.lua` — Global keymaps and custom functions (e.g., `toggle_gutter()`)
- `lazy.lua` — Bootstraps lazy.nvim and imports all plugin specs from `lua/plugins/`

**Plugin specs** (`lua/plugins/`): Each file returns a lazy.nvim spec table (or array of tables). Plugins use event/key/ft-based lazy loading.

## Key Conventions

- **Leader key:** `<space>`
- **Keybinding namespaces:** `<leader>f` (finder/telescope), `<leader>t` (toggles), `<leader>a` (Claude AI), `<leader>s` (search/snacks), `<leader>h` (git hunks), `gr` (LSP)
- **Nerd Font aware:** `vim.g.have_nerd_font = true` is set; many plugins use this for icon fallback
- **LSP keybindings** are set via `LspAttach` autocmd in `lua/plugins/lsp.lua` using a local `map()` helper
- **No mouse** (`mouse = ""`), keyboard-only workflow
- **Python LSP:** `pylsp` with only `pycodestyle` enabled (E501 ignored, max line 120)

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec table. It will be auto-imported. Follow existing patterns for lazy-loading (`event`, `keys`, `ft` fields).

## Custom Abstractions

- `toggle_gutter()` in `keybinds.lua` — toggles line numbers, signcolumn, foldcolumn, and Snacks indent guides together
- `toggle_telescope()` in `harpoon.lua` — shows Harpoon list via Telescope picker
- LSP `map()` helper in `lsp.lua` — wraps `vim.keymap.set` with buffer scope and description

## Dependencies

- **ripgrep** (required for Telescope grep)
- **Nerd Font** (JetBrains Mono or Caskaydia Cove)
- **Node/npm** (for some Mason-managed LSP servers)
