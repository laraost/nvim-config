# NeoVim Configuration

## Plugins

- [`lazy.nvim`](https://github.com/folke/lazy.nvim): pluging management
- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim): file system browsing
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): search (in) files. Does not search in files ignored via `.gitignore`.
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): auto-completion
- [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp): allows `nvim-cmp` to interact with LSPs
- [`fugitive.vim`](https://github.com/tpope/vim-fugitive): interaction with Git
- [`nvim-autopairs`](https://gihub.com/windwp/nvim-autopairs): auto-close parentheses and such
- [`which-key.nvim`](https://github.com/folke/which-key.nvim): show available key mappings
- [`sonokai`](https://github.com/sainnhe/sonokai): dark colorscheme
- [`alabaster.nvim`](https://github.com/p00f/alabaster.nvim): light colorscheme

## Colors

Includes a dark colorscheme that uses sonokai colors in alabaster.nvim; see `colors/sonobaster.lua`.

## Key Mapping

`leader` is space, `localleader` is backslash.

In normal mode:
| `lhs`           | Action/Note                                       | Plugin          |
|-----------------|---------------------------------------------------|-----------------|
| `<Leader>/`     | Disable highlights of last search                 |                 |
| `<Leader>D`     | Toggle light/dark mode                            |                 |
|                 | *Buffer management*                               |                 |
| `<Leader>c`     | Close the focused buffer/file                     |                 |
| `<Leader>C`     | Close the focused buffer/file without saving      |                 |
| `<Leader>n`     | Open a new file                                   |                 |
| `<Leader>#`     | Go to last open buffer                            |                 |
| `<Leader>bs`    | Shortcut for `:sb `                               |                 |
| `<Leader>bs`    | Shortcut for `:vert sb `                          |                 |
|                 | *Tabs*                                            |                 |
| `<Leader>t`     | Open a new tab                                    |                 |
| `<Leader>T`     | Close the current tab                             |                 |
| `<Leader>h`     | Go to previous tab                                |                 |
| `<Leader>l`     | Go to next tab                                    |                 |
|                 | *Window management*                               |                 |
| `<C-h>`         | Go to the left window                             |                 |
| `<C-j>`         | Go to the down window                             |                 |
| `<C-k>`         | Go to the up window                               |                 |
| `<C-l>`         | Go to the right window                            |                 |
| `<Leader>ws`    | Split window horizontally                         |                 |
| `<Leader>wv`    | Split window vertically                           |                 |
| `<Leader>wc`    | Close the current split                           |                 |
|                 | *File browsing*                                   |                 |
| `<Leader>o`     | Open file browser                                 | neo-tree.nvim   |
| `<Leader>ff`    | Search file names, respecting .gitignore          | telescope.nvim  |
| `<Leader>fg`    | Search in files, respecting .gitignore            | telescope.nvim  |
| `<Leader>fs`    | Search string under cursor, respecting .gitignore | telescope.nvim  |
| `<C-b>`/`<C-f`> | Scroll documentation in auto-complete menu        | nvim-cmp        |
| `<C-space>`     | `cmp.mapping.complete()`                          | nvim-cmp        |
| `<C-e>`         | Abort auto-completion                             | nvim-cmp        |
| `<CR>`          | Confirm auto-completion                           | nvim-cmp        |
| `K`             | Show information about symbol under cursor        |                 |
| `<Leader>ga`    | List code actions                                 |                 |
| `<Leader>gd`    | Go to definition                                  |                 |
| `<Leader>gD`    | Go to declaration                                 |                 |
| `<Leader>ge`    | Show diagnostics                                  |                 |
| `<Leader>gE`    | List all diagnostics                              | telescope       |
| `<Leader>gi`    | Go to implementation                              |                 |
| `<Leader>gn`    | Go to next diagnostic                             |                 |
| `<Leader>gN`    | Go to previous diagnostic                         |                 |
| `<Leader>go`    | Go to type definition of symbol under cursor      |                 |
| `<Leader>gr`    | List references to symbol under cursor            | telescope       |
| `<Leader>gs`    | Signature help                                    |                 |
| `<Leader>gS`    | List symbols defined in current file              | telescope       |
| `<F2>`          | Rename symbol under cursor                        |                 |
| `<F3>`          | Format                                            |                 |

## Custom Local Configuration

To support small configuration changes on different machines, e.g., because you need to set tabwidth to something other than 3,
`init.lua` sources the file `local.lua`, if it exists.
