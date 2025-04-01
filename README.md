# NeoVim Configuration

## Plugins and Structure

The structure is
```
nvim
+-lua
| +-config
| | +-keys.lua
| | +-lazy.lua
| +-plugins
|   +-files.lua
|   +-ui.lua
+-README.md
+-init.lua
```

Plugins are managed via [`lazy.nvim`](https://github.com/folke/lazy.nvim), which is configured in `lua/config/lazy.lua`.
The plugin specs are located in the `lua/plugins/` directory, separated into files roughly by functionality.

[Key mappings](#key-mapping) are defined in `lua/config/keys.lua`, apart from `leader` and `localleader`.

| File                    | Section                                     |
|-------------------------|---------------------------------------------|
| `lua/plugins/files.lua` | [File-Related Things](#file-related-things) |
| `lua/plugins/ui.lua`    | [UI-Related Things](#ui-related-things)     |

### File-Related Things

- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim): file system browsing

### UI-Related Things 

- [`catppuccin/nvim`](https://github.com/catppuccin/nvim): color scheme
- [`which-key.nvim`](https://github.com/folke/which-key.nvim): show available key mappings
- [`nvim-cokeline`](https://github.com/willothy/nvim-cokeline): buffer line

## Key Mapping

`leader` is space, `localleader` is backslash.

In normal mode:
| `lhs`         | Action/Note                                     | Plugin        |
|---------------|-------------------------------------------------|---------------|
| `<Leader>c`   | Close the focused buffer/file                   |               |
| `<Leader>b`   | *Buffer management*                             |               |
| `<Leader>bp`  | Go to previous buffer (left in the buffer line) |               |
| `<Leader>bn`  | Go to next buffer (right in the buffer line)    |               |
| `<Leader>b#`  | Go to last open buffer                          |               |
| `<Leader>w`   | *Window management*                             |               |
| `<Leader>wh`  | Go to the left window                           |               |
| `<Leader>wj`  | Go to the down window                           |               |
| `<Leader>wk`  | Go to the up window                             |               |
| `<Leader>wl`  | Go to the right window                          |               |
| `<Leader>ws`  | Split window horizontally                       |               |
| `<Leader>wv`  | Split window vertically                         |               |
| `<Leader>f`   | *File browsing*                                 | [`files.lua`](#file-related-things) |
| `<Leader>fo`  | Toggle file system browser                      | neo-tree.nvim |
| `<Leader>fe`  | Focus file system browser                       | neo-tree.nvim |

## Possible Improvements

- [] If, after `<Leader>c`, only one file is open, splits are closed. This feels strange.
