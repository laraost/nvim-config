# NeoVim Configuration

## Plugins and Structure

The structure is
```
nvim
+-lua
| +-config
| | +-keys.lua
| | +-lazy.lua
| | +-lsp.lua
| | +-options.lua
| +-plugins
|   +-files.lua
|   +-ui.lua
+-README.md
+-init.lua
```

Plugins are managed via [`lazy.nvim`](https://github.com/folke/lazy.nvim), which is configured in `lua/config/lazy.lua`.
The plugin specs are located in the `lua/plugins/` directory, separated into files roughly by functionality.

[Key mappings](#key-mapping) are defined in `lua/config/keys.lua`, apart from `leader` and `localleader`.

| File                          | Section                                         |
|-------------------------------|-------------------------------------------------|
| `lua/plugins/files.lua`       | [File-Related Things](#file-related-things)     |
| `lua/plugins/code.lua`        | [Coding-Related Things](#coding-related-things) |
| `lua/plugins/ui.lua`          | [UI-Related Things](#ui-related-things)         |
| `lua/plugins/sessions.lua`    | [Sessions](#sessions)                           |

### File-Related Things

- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim): file system browsing
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): search (in) files. Requires [`ripgrep`](https://github.com/BurntSushi/ripgrep) for live search. Does not search in files ignored via `.gitignore`.

### Coding-Related Things

- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): auto-completion
- [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp): allows `nvim-cmp` to interact with LSPs

Setup for LSPs is in `lua/config/lsp.lua` and is not automated.

### UI-Related Things 

- [`catppuccin/nvim`](https://github.com/catppuccin/nvim): color scheme
- [`which-key.nvim`](https://github.com/folke/which-key.nvim): show available key mappings
- [`nvim-cokeline`](https://github.com/willothy/nvim-cokeline): buffer line

### Sessions

- [`auto-sessions`](https://github.com/rmagatti/auto-session): session management. Sessions are per directory and branch. Restore on startup is disabled.

## Key Mapping

`leader` is space, `localleader` is backslash.

In normal mode:
| `lhs`           | Action/Note                                       | Plugin        |
|-----------------|---------------------------------------------------|---------------|
| `<Leader>/`     | Disable highlights of last search                 |               |
| `<Leader>D`     | Toggle light/dark mode                            |               |
|                 | *Buffer management*                               |               |
| `<Leader>c`     | Close the focused buffer/file                     |               |
| `<Leader>C`     | Close the focused buffer/file without saving      |               |
| `<Leader>bh`    | Go to previous buffer (left in the buffer line)   |               |
| `<Leader>bl`    | Go to next buffer (right in the buffer line)      |               |
| `<Leader>b#`    | Go to last open buffer                            |               |
|                 | *Window management*                               |               |
| `<C-h>`         | Go to the left window                             |               |
| `<C-j>`         | Go to the down window                             |               |
| `<C-k>`         | Go to the up window                               |               |
| `<C-l>`         | Go to the right window                            |               |
| `<Leader>ws`    | Split window horizontally                         |               |
| `<Leader>wv`    | Split window vertically                           |               |
|                 | *File browsing*                                   | [`files.lua`](#file-related-things) |
| `<Leader>o`     | Open file browser                                 | neo-tree.nvim  |
| `<Leader>O`     | Toggle file browser on the left                   | neo-tree.nvim  |
| `<Leader>e`     | Focus file browser on the left                    | neo-tree.nvim  |
| `<Leader>ff`    | Search file names, respecting .gitignore          | telescope.nvim |
| `<Leader>fg`    | Search in files, respecting .gitignore            | telescope.nvim |
| `<Leader>fs`    | Search string under cursor, respecting .gitignore | telescope.nvim |
|                 | *Sessions*                                        | [`sessions.lua`](#sessions) |
| `<Leader>S`     | Restore previous session for this directory       | auto-session  |
| `<Leader>sd`    | Delete the session for this directory             | auto-session  |
| `<Leader>ss`    | Load a session from a list                        | auto-session  |
| `<Leader>sx`    | Delete a session from a list                      | auto-session  |
|                 |                                                   | [`code.lua`](#coding-related-things) |
| `<C-b>`/`<C-f`> | Scroll documentation in auto-complete menu        | nvim-cmp        |
| `<C-space>`     | `cmp.mapping.complete()`                          | nvim-cmp        |
| `<C-e>`         | Abort auto-completion                             | nvim-cmp        |
| `<CR>`          | Confirm auto-completion                           | nvim-cmp        |
| `gnn`           | Initialize incremental selection                  | nvim-treesitter |
| `grn`           | Increment selection to node                       | nvim-treesitter |
| `grc`           | Increment selection to surrounding scope          | nvim-treesitter |
| `grm`           | Shrink selection to node                          | nvim-treesitter |

## Notes

The mappings `<Leader>c` and `<Leader>C` close the currently focused buffer.
If there is only one "listed" buffer (those shown in the buffer line, which should be those listed by ":ls"),
then a new empty buffer is created.
The functionality around these mappings might not interact well with the (Neo)Vim's native tabpages. Better not use them with this config...

## Possible Improvements and Other To-Dos

- [ ] Document LSP key mappings.
- [ ] LSP related windows have no border. Maybe in general hovering windows could use a border.
- [ ] Use something like [auto-dark-mode](https://github.com/f-person/auto-dark-mode.nvim) to switch light/dark based on system settings.
- [ ] (Neo)Vim's builtin tabs don't work well with this setup. They feel somewhat janky in combination with `<Leader>c`.
- [ ] When the focused buffer is open in multiple windows, using `<Leader>c`/`<Leader>C` closes those windows. This is very inelegant and annoying.
