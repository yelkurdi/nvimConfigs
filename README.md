# My Neovim Configuration

A Neovim configuration focused on Python development.

Mostly adapted from tonybanters's [repo](https://github.com/tonybanters/nvim) and his
very nice YouTube [tutorial](https://www.youtube.com/watch?v=46z_h4bNzjk). Thanks Tony!

## Install

1. Back up any existing Neovim config:

   ```bash
   cd ~/.config/
   mv nvim nvim_backup
   ```

2. Clone this repo:

   ```bash
   git clone git@github.com:yelkurdi/nvimConfigs.git ~/.config/nvim
   ```

3. Install platform-specific dependencies (see below).

4. Alias `vim` to `nvim` in your `~/.bashrc` (or `~/.zshrc`):

   ```bash
   alias vim=nvim
   ```

## Dependencies

### macOS

Install Nerd Fonts for iTerm:

```bash
brew install --cask font-jetbrains-mono-nerd-font font-caskaydia-cove-nerd-font
```

Install ripgrep:

```bash
brew install ripgrep
```

Install Claude Code:

```bash
brew install --cask claude-code
```

### Linux (bluevela and ccc)

On these clusters, neither `ripgrep` nor a recent `nvim` is available, so we build
both from source into `~/.local`.

1. Install [Rust](https://rust-lang.org/learn/get-started/).

2. Build [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#building)
   from source:

   ```bash
   cargo install --root ~/.local --path .
   ```

3. Build Neovim from source:

   ```bash
   mkdir /tmp/nvim && cd /tmp/nvim
   git clone git@github.com:neovim/neovim.git
   cd neovim
   make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=~/.local/
   make install
   ```

## Resources

- Nice key mappings — [Seth Phaeno](https://www.youtube.com/watch?v=FGVY7gbaoQI)
