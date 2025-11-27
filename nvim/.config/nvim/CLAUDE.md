# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using Lua and the built-in `vim.pack` package manager (Nvim 0.10+). The configuration is designed for PHP development with a focus on minimal dependencies and native Neovim features.

## Package Management

This configuration uses Neovim's native package manager instead of external plugin managers like Lazy or Packer.

### Commands

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

The package lock file `nvim-pack-lock.json` tracks installed plugin versions. After adding a new plugin, run `:PackUpdate` to install it.

## Architecture

### Directory Structure

```
init.lua                   -- Entry point, loads all modules
lua/
├── modules/               -- Custom modules
│   └── session_helper.lua -- Session and directory management
├── configs/               -- Configuration files
│   ├── options.lua        -- Neovim options
│   └── lsp.lua            -- LSP server configuration
├── plugins/               -- Plugin declarations and setup
│   ├── lsp.lua
│   ├── git.lua
│   ├── ui.lua
│   ├── edit.lua
│   ├── move.lua
│   ├── treesitter.lua
│   └── colorscheme.lua
├── commands/              -- Custom commands
│   └── pack.lua           -- Package management commands
└── keymaps.lua            -- All keybindings
```

### Initialization Flow

1. `init.lua` configures the session helper for dotfiles project management
2. Loads configs (options, LSP settings)
3. Loads all plugins (plenary first as it's a dependency)
4. Loads custom commands (pack management)
5. Loads keymaps last

### Session Management

The custom `session_helper` module provides special handling for dotfiles:

- When loading a session in the dotfiles repo, it automatically changes to the appropriate subdirectory (neovim, ghostty, git, phpactor)
- This is configured in `init.lua` via `project_directories` mapping session names to directories

## LSP Configuration

### Enabled LSP Servers

Servers are enabled in `lua/configs/lsp.lua` using `vim.lsp.enable()`:
- `jsonls` (JSON)
- `lemminx` (XML)
- `lua_ls` (Lua)
- `pest_ls` (PHP Pest testing)
- `phpactor` (PHP)
- `yamlls` (YAML)

### Installing LSP Servers

Use Mason to install language servers:
```vim
:Mason
```

Phpactor is special-cased with custom installation configuration in `lua/plugins/lsp.lua`.

### LSP Features

- Native LSP completion enabled on attach with autotrigger
- Diagnostics configured with emoji signs and rounded borders
- Virtual text disabled (use `<leader>lD` to show diagnostics in float)

## Keymap Groups

Leader key is `<space>`. All keymaps are defined in `lua/keymaps.lua`:

- `<leader>b` - Buffer operations
- `<leader>c` - Multicursor operations
- `<leader>f` - File/Find operations (uses mini.pick)
- `<leader>g` - Git operations (Neogit, Diffview, Gitsigns)
- `<leader>l` - LSP operations
- `<leader>p` - PHP/Phpactor operations
- `<leader>q` - Quickfix operations
- `<leader>s` - Session operations
- `<leader>t` - Todo comments

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

### Editing Configuration

1. Make changes to Lua files
2. Use `<leader>br` to update and source the current buffer
3. For full reload, restart Neovim or `:source init.lua`

### Testing Plugin Changes

After modifying plugin configurations:
1. Make changes in `lua/plugins/*.lua`
2. Run `:PackUpdate` if adding new plugins
3. Restart Neovim to apply changes

### Common File Locations

- Keybindings: `lua/keymaps.lua`
- Options: `lua/configs/options.lua`
- LSP servers: `lua/configs/lsp.lua`
- Plugin additions: Find the appropriate file in `lua/plugins/`

## Notes

- This configuration is part of a larger dotfiles repository managed with GNU Stow
- The configuration targets Linux (specifically tested on Linux 6.17.0-7-generic)
- Uses system clipboard by default (`clipboard=unnamedplus`)
- Treesitter folding enabled with `foldlevel=10`
