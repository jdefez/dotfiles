# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Overview

This is a personal Neovim configuration using Lua and the built-in `vim.pack`
package manager (Nvim 0.12). The configuration is designed for PHP development
with a focus on minimal dependencies and native Neovim features.

## Package Management

This configuration uses Neovim's native package manager (`vim.pack`) instead of
external plugin managers like Lazy or Packer. This requires Neovim 0.12.

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

After declaring plugins, immediately run `:PackUpdate` to install them. The
package lock file `nvim-pack-lock.json` tracks installed plugin versions.

**IMPORTANT**: Plugin setup code (e.g., `require('plugin').setup({})`) must be
placed in the same file where `vim.pack.add()` declares the plugin. Each plugin
file is responsible for both declaration and configuration.

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
│   ├── pack.lua           -- Package management commands
│   ├── copy-path.lua      -- Copy file path command
│   └── playground.lua     -- Command testing playground
└── keymaps.lua            -- All keybindings (loaded last)
```

### Initialization Flow

Loading order in `init.lua` (order matters):
1. Configure the `session_helper` module with dotfiles-specific project directories
2. Load configs: `configs/options` and `configs/lsp`
3. Load all plugins in order (plenary first as it's a dependency for other plugins)
4. Load custom commands: `commands/pack`, `commands/copy-path`, `commands/playground`
5. Load keymaps last: `keymaps.lua`

### Session Management

The custom `session_helper` module (`lua/modules/session_helper.lua`) provides
intelligent directory switching:

**For dotfiles repository**: When loading a session, it automatically changes
to the correct subdirectory based on session name:
- Session "neovim" → `~/dotfiles/nvim/.config/nvim`
- Session "ghostty" → `~/dotfiles/ghostty/.config/ghostty`
- Session "git" → `~/dotfiles/git/`
- Session "phpactor" → `~/dotfiles/phpactor/.config/phpactor`

**For other projects**: Automatically finds and changes to the git root directory.

This is hooked into `mini.sessions` via the `hooks.post.read` callback in `lua/plugins/ui.lua:43`.

## LSP Configuration

### Enabled LSP Servers

Servers are enabled using `vim.lsp.enable()` in both `lua/configs/lsp.lua` and `lua/plugins/lsp.lua`:
- `jsonls` (JSON)
- `lemminx` (XML)
- `lua_ls` (Lua - with special Neovim development configuration)
- `pest_ls` (PHP Pest testing)
- `phpactor` (PHP - special configuration)
- `yamlls` (YAML)

### Installing LSP Servers

Use Mason to install language servers:
```vim
:Mason
```

**Phpactor special case**: Configured in `lua/plugins/lsp.lua` with custom
installation settings. The plugin is installed to
`stdpath("data")/mason/packages/phpactor/` and uses `phpactor.phar`. LSPConfig
integration is disabled (`lspconfig.enabled = false`) in favor of direct
configuration.

**Lua_ls special case**: Configured in `lua/plugins/lsp.lua` using `vim.lsp.config()` with Neovim development settings including workspace library paths and LuaJIT runtime configuration.

### LSP Features

- Native LSP completion enabled on attach with autotrigger (configured in `lua/configs/lsp.lua:14-24`)
- Inlay hints automatically enabled on LSP attach if server supports them (configured in `lua/configs/lsp.lua:26-28`)
- Diagnostics use emoji signs: 💥 (error), ⚠️ (warn), 💡 (info), 🤘 (hint)
- Virtual text disabled - use `<leader>lw` to show diagnostics in float
- Floating windows use rounded borders

## Custom Commands

### `:Copypath` Command

Defined in `lua/commands/copy-path.lua`:
- `:Copypath` or `:Copypath filename` - Copy filename to clipboard
- `:Copypath relative` - Copy relative path to clipboard
- `:Copypath absolute` - Copy absolute path to clipboard

## Keymap Groups

Leader key is `<space>`. All keymaps are defined in `lua/keymaps.lua`.

**Keymap discovery**: Uses `mini.clue` configured at the top of `keymaps.lua` to show available keymaps when you press `<leader>`.

### Leader Key Groups

- `<leader>b` - Buffer operations (delete, find, new, update & source, outline, buffer sticks)
- `<leader>c` - Multicursor operations (add, skip, match, search cursors)
- `<leader>f` - File/Find operations (uses mini.pick for files, grep, help, global notes)
- `<leader>g` - Git operations (Neogit, Diffview, hunks)
- `<leader>l` - LSP operations (actions, definition, format, implementation, diagnostics, hover, references, symbols)
- `<leader>p` - PHP/Phpactor operations (context menu)
- `<leader>q` - Quickfix operations (toggle with quicker.nvim)
- `<leader>s` - Session operations (mini.sessions: delete, new, read, write)
- `<leader>t` - Todo comments (`:TodoLocList`)

### Special Keymaps

- `jk` in insert mode → ESC
- `<esc>` → Clear search highlights
- `s` / `S` → Flash jump / Flash treesitter (fast motion)
- `r` (operator mode) → Remote flash
- `R` (operator/visual mode) → Flash treesitter search
- Arrow keys (up/down) → Add multicursor above/below
- Shift+Arrow keys → Skip multicursor
- Left/Right arrows (when multiple cursors active) → Rotate cursor selection
- `<C-q>` → Toggle cursors
- `<C-h/j/k/l>` → Navigate between splits
- `ga` → Add cursor operator (e.g., `gaip` adds cursor to each paragraph line)
- `M` (visual mode) → Match cursors by regex
- `Y` → Yank to end of line

### Buffer Operations (`<leader>b`)

- `<leader>bd` - Delete buffer
- `<leader>bD` - Force delete buffer
- `<leader>bf` - Find buffers (mini.pick)
- `<leader>bh` - Buffer sticks: hide
- `<leader>bj` - Buffer sticks: jump
- `<leader>bn` - New buffer
- `<leader>br` - Update and source current file
- `<leader>bo` - Toggle outline

### File Operations (`<leader>f`)

- `<leader>ff` - Find files (mini.pick)
- `<leader>fe` - Oil file explorer
- `<leader>fh` - Find help
- `<leader>fl` - Grep current file lines
- `<leader>fn` - Toggle global note
- `<leader>fr` - Mini pick resume
- `<leader>fW` - Grep live
- `<leader>fw` - Grep word under cursor

### LSP Operations (`<leader>l`)

- `<leader>la` - Display code actions (fastaction)
- `<leader>ld` - Go to definition
- `<leader>lf` - Format buffer
- `<leader>li` - Go to implementation
- `<leader>lw` - Show diagnostic float
- `<leader>lk` - Hover documentation
- `<leader>lr` - Find references (mini.pick)
- `<leader>ls` - Workspace symbols (mini.pick)
- `<leader>lS` - Document symbols (mini.pick)

### Multicursor Operations (`<leader>c`)

- `<leader>cj` - Add cursor & match next
- `<leader>ck` - Add cursor & match previous
- `<leader>cJ` - Skip cursor & match next
- `<leader>cK` - Skip cursor & match previous
- `<leader>c/` - Add cursor & search next
- `<leader>c#` - Add cursor & search previous
- `<leader>cs/` - Skip cursor & search next
- `<leader>cs#` - Skip cursor & search previous
- `<leader>cI` - Insert visual selection (multi-cursor)
- `<leader>cA` - Append visual selection (multi-cursor)
- `<leader>cx` - Delete cursor (when multiple cursors active)

## Key Plugins

### Navigation & Editing

- **flash.nvim** - Fast motion with `s` and `S`
- **multicursor.nvim** - Multiple cursors with arrow keys and leader mappings
- **oil.nvim** - File explorer (`<leader>fe`)
- **oil-git.nvim** - Git integration for oil.nvim
- **nvim-surround** - Surround text objects
- **mini.pairs** - Auto-pair brackets and quotes
- **buffer-sticks.nvim** - Buffer management and navigation
- **outline.nvim** - Code outline viewer (`<leader>bo`)

### UI

- **mini.statusline** - Minimalist statusline
- **mini.starter** - Start screen
- **mini.cmdline** - Command line UI
- **mini.animate** - Smooth animations (cursor animation disabled)
- **barbecue.nvim** - LSP breadcrumbs
- **mini.indentscope** - Indent scope visualization
- **virtcolumn.nvim** - Virtual column indicator
- **auto-save.nvim** - Automatic file saving
- **render-markdown.nvim** - Markdown rendering with LSP completion support
- **global-note.nvim** - Global note taking (`<leader>fn`)

### Git

- **neogit** - Git interface (`<leader>go`)
- **diffview.nvim** - Git diff viewer (`<leader>gO`)
- **gitsigns.nvim** - Git signs in gutter

### LSP & Completion

- **nvim-lspconfig** - LSP configuration
- **phpactor.nvim** - PHP language server with custom installation
- **mason.nvim** - LSP server installer
- **fastaction.nvim** - Quick code actions (`<leader>la`)
- **supermaven-nvim** - AI completion (Tab to accept, Ctrl+] to clear, Ctrl+w to accept word)

### Utility

- **mini.pick** - Fuzzy finder
- **mini.extra** - Extra mini.nvim modules
- **mini.sessions** - Session management
- **mini.bufremove** - Safe buffer deletion
- **quicker.nvim** - Enhanced quickfix (`<leader>qt`)
- **todo-comments.nvim** - Highlight and search TODO comments

## Testing

Tests live in `tests/` and use the [busted](https://lunarmodules.github.io/busted/) framework via plenary.nvim.

### Running Tests

Run a specific test file using nvim in headless mode:

```bash
nvim --headless -c "PlenaryBustedFile tests/test_collection.spec.lua"
```

Test files follow the naming convention `test_<module>.spec.lua`.

## Development Workflow

### Editing Configuration Files

1. Make changes to Lua files
2. Use `<leader>br` to update (save) and source the current buffer
3. For full reload, restart Neovim or `:source init.lua`

### Adding a New Plugin

1. Identify the appropriate plugin file in `lua/plugins/` (ui, lsp, git, edit, move, etc.)
2. Add the plugin declaration with `vim.pack.add({ { src = "https://github.com/..." } })`
3. Add the plugin's setup code (e.g., `require('plugin').setup({})`) in the same file
4. Run `:PackUpdate` to install the plugin
5. Restart Neovim to fully load the plugin
6. Add keymaps in `lua/keymaps.lua` if needed

### Modifying Keymaps

All keymaps are centralized in `lua/keymaps.lua`. After editing, use `<leader>br` to reload, or restart Neovim.

### Common File Locations

- **All keybindings**: `lua/keymaps.lua`
- **Neovim options**: `lua/configs/options.lua`
- **LSP server list**: `lua/configs/lsp.lua` and `lua/plugins/lsp.lua`
- **LSP server configs**: `lua/plugins/lsp.lua` (uses `vim.lsp.config()` for server-specific settings)
- **Plugin declarations**: `lua/plugins/*.lua` (choose appropriate category file)
- **Custom commands**: `lua/commands/*.lua`

## Notes

- This configuration is part of a larger dotfiles repository managed with GNU Stow
- The configuration targets Linux (specifically tested on Linux 6.17.0-8-generic)
- Uses system clipboard by default (`clipboard=unnamedplus`)
- Treesitter folding enabled with `foldlevel=10`
- Color column set at 80 characters
- Inlay hints enabled automatically when LSP server supports them
