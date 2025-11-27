# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using Lua and the built-in `vim.pack` package manager (Nvim 0.10+).
The configuration is designed for PHP development with a focus on minimal dependencies and native Neovim features.

## Package Management

This configuration uses Neovim's native package manager (`vim.pack`) instead of external plugin managers like Lazy or Packer. This requires Neovim 0.10+.

### Commands

Defined in `lua/commands/pack.lua`:
- **Update packages**: `:PackUpdate` - Updates all packages (add `!` to force)
- **Update specific package**: `:PackUpdate <package-name>`
- **Delete package**: `:PackDelete <package-name>`

### Adding New Plugins

Plugins are declared in `lua/plugins/*.lua` files using:

```lua
vim.pack.add({
    { src = "https://github.com/username/plugin-name" },
})
```

After declaring plugins, immediately run `:PackUpdate` to install them. The package lock file `nvim-pack-lock.json` tracks installed plugin versions.

**IMPORTANT**: Plugin setup code (e.g., `require('plugin').setup({})`) must be placed in the same file where `vim.pack.add()` declares the plugin. Each plugin file is responsible for both declaration and configuration.

## Architecture

### Directory Structure

```
init.lua                   -- Entry point, loads all modules
nvim-pack-lock.json        -- Package version lock file
lua/
├── modules/               -- Custom modules
│   └── session_helper.lua -- Session and directory management
├── configs/               -- Configuration files
│   ├── options.lua        -- Neovim options
│   └── lsp.lua            -- LSP server configuration
├── plugins/               -- Plugin declarations AND setup
│   ├── plenary.lua        -- Dependency loaded first
│   ├── icons.lua          -- Icon sets
│   ├── ui.lua             -- UI plugins (mini.*, barbecue, auto-save)
│   ├── lsp.lua            -- LSP and completion
│   ├── git.lua            -- Git plugins
│   ├── edit.lua           -- Editing enhancements
│   ├── move.lua           -- Navigation and movement
│   ├── treesitter.lua     -- Treesitter config
│   └── colorscheme.lua    -- Color scheme
├── commands/              -- Custom commands
│   └── pack.lua           -- Package management commands
└── keymaps.lua            -- All keybindings (loaded last)
```

### Initialization Flow

Loading order in `init.lua` (order matters):
1. Configure the `session_helper` module with dotfiles-specific project directories
2. Load configs: `configs/options` and `configs/lsp`
3. Load all plugins in order (plenary first as it's a dependency for other plugins)
4. Load custom commands: `commands/pack`
5. Load keymaps last: `keymaps.lua`

### Session Management

The custom `session_helper` module (`lua/modules/session_helper.lua`) provides intelligent directory switching:

**For dotfiles repository**: When loading a session, it automatically changes to the correct subdirectory based on session name:
- Session "neovim" → `~/dotfiles/nvim/.config/nvim`
- Session "ghostty" → `~/dotfiles/ghostty/.config/ghostty`
- Session "git" → `~/dotfiles/git/`
- Session "phpactor" → `~/dotfiles/phpactor/.config/phpactor`

**For other projects**: Automatically finds and changes to the git root directory.

This is hooked into `mini.sessions` via the `hooks.post.read` callback in `lua/plugins/ui.lua:34`.

## LSP Configuration

### Enabled LSP Servers

Servers are enabled in `lua/configs/lsp.lua` using `vim.lsp.enable()`:
- `jsonls` (JSON)
- `lemminx` (XML)
- `lua_ls` (Lua)
- `pest_ls` (PHP Pest testing)
- `phpactor` (PHP - special configuration)
- `yamlls` (YAML)

### Installing LSP Servers

Use Mason to install language servers:
```vim
:Mason
```

**Phpactor special case**: Configured in `lua/plugins/lsp.lua` with custom installation settings.
The plugin is installed to `stdpath("data")/mason/packages/phpactor/` and uses `phpactor.phar`.
LSPConfig integration is disabled (`lspconfig.enabled = false`) in favor of direct configuration.

### LSP Features

- Native LSP completion enabled on attach with autotrigger (configured in `lua/configs/lsp.lua:14-21`)
- Diagnostics use emoji signs: 💥 (error), ⚠️ (warn), 💡 (info), 🤘 (hint)
- Virtual text disabled - use `<leader>lD` to show diagnostics in float
- Floating windows use rounded borders

## Keymap Groups

Leader key is `<space>`. All keymaps are defined in `lua/keymaps.lua`.

**Keymap discovery**: Uses `mini.clue` configured at the top of `keymaps.lua` to show available keymaps when you press `<leader>`.

### Leader Key Groups

- `<leader>b` - Buffer operations (delete, find, new, update & source)
- `<leader>c` - Multicursor operations (add, skip, match, search cursors)
- `<leader>f` - File/Find operations (uses mini.pick for files, grep, help, sessions)
- `<leader>g` - Git operations (Neogit, Diffview, hunks)
- `<leader>l` - LSP operations (definition, diagnostics, format, hover, references, symbols)
- `<leader>p` - PHP/Phpactor operations (context menu)
- `<leader>q` - Quickfix operations (toggle with quicker.nvim)
- `<leader>s` - Session operations (mini.sessions: delete, new, read, write)
- `<leader>t` - Todo comments (`:TodoLocList`)

### Special Keymaps

- `jk` in insert mode → ESC
- `<esc>` → Clear search highlights
- `s` / `S` → Flash jump / Flash treesitter (fast motion)
- Arrow keys (up/down) → Add multicursor above/below
- Shift+Arrow keys → Skip multicursor
- `<C-h/j/k/l>` → Navigate between splits
- `ga` → Add cursor operator (e.g., `gaip` adds cursor to each paragraph line)

## Key Plugins

### Navigation & Editing

- **flash.nvim** - Fast motion with `s` and `S`
- **multicursor.nvim** - Multiple cursors with arrow keys and leader mappings
- **oil.nvim** - File explorer (`<leader>fe`)
- **nvim-surround** - Surround text objects

### UI

- **mini.statusline** - Minimalist statusline
- **mini.starter** - Start screen
- **barbecue.nvim** - LSP breadcrumbs
- **mini.indentscope** - Indent scope visualization

### Git

- **neogit** - Git interface (`<leader>go`)
- **diffview.nvim** - Git diff viewer (`<leader>gO`)
- **gitsigns.nvim** - Git signs in gutter

### LSP & Completion

- **nvim-lspconfig** - LSP configuration
- **phpactor.nvim** - PHP language server
- **fastaction.nvim** - Quick code actions
- **supertab.nvim** - Tab completion
- **supermaven-nvim** - AI completion

### Utility

- **mini.pick** - Fuzzy finder (replaces Telescope)
- **mini.sessions** - Session management
- **mini.bufremove** - Safe buffer deletion
- **quicker.nvim** - Enhanced quickfix

## Development Workflow

### Editing Configuration Files

1. Make changes to Lua files
2. Use `<leader>br` to update (save) and source the current buffer
3. For full reload, restart Neovim or `:source init.lua`

### Adding a New Plugin

1. Identify the appropriate plugin file in `lua/plugins/` (ui, lsp, git, edit, move, etc.)
2. Add the plugin declaration with `vim.pack.add({{ src = "https://github.com/..." }})`
3. Add the plugin's setup code (e.g., `require('plugin').setup({})`) in the same file
4. Run `:PackUpdate` to install the plugin
5. Restart Neovim to fully load the plugin
6. Add keymaps in `lua/keymaps.lua` if needed

### Modifying Keymaps

All keymaps are centralized in `lua/keymaps.lua`. After editing, use `<leader>br` to reload, or restart Neovim.

### Common File Locations

- **All keybindings**: `lua/keymaps.lua`
- **Neovim options**: `lua/configs/options.lua`
- **LSP server list**: `lua/configs/lsp.lua` (uses `vim.lsp.enable()`)
- **Plugin declarations**: `lua/plugins/*.lua` (choose appropriate category file)

## Notes

- This configuration is part of a larger dotfiles repository managed with GNU Stow
- The configuration targets Linux (specifically tested on Linux 6.17.0-7-generic)
- Uses system clipboard by default (`clipboard=unnamedplus`)
- Treesitter folding enabled with `foldlevel=10`
