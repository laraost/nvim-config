# NeoVim Configuration

## Plugins

- [`lazy.nvim`](https://github.com/folke/lazy.nvim): pluging management; automatic updates are disabled
- [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): searching (in) files.
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): auto-completion
- [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp): allows `nvim-cmp` to interact with LSPs
- [`alabaster.nvim`](https://github.com/p00f/alabaster.nvim): light colorscheme

## Colors

Includes a custom dark colorscheme that uses [sonokai](https://github.com/sainnhe/sonokai) colors in alabaster.nvim; see `colors/sonobaster.lua`.

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
|                 | *Windows and Tabs*                                |                 |
| `<C-h>`         | Go to the left window                             |                 |
| `<C-j>`         | Go to the down window                             |                 |
| `<C-k>`         | Go to the up window                               |                 |
| `<C-l>`         | Go to the right window                            |                 |
| `<Leader>ws`    | Split window horizontally                         |                 |
| `<Leader>wv`    | Split window vertically                           |                 |
| `<Leader>wc`    | Close the current split                           |                 |
| `<Leader>t`     | Open a new tab                                    |                 |
|                 | *Fuzzy Finding*                                   |                 |
| `<Leader>ff`    | Search file names, respecting .gitignore          | telescope.nvim  |
| `<Leader>fg`    | Search in files, respecting .gitignore            | telescope.nvim  |
| `<Leader>fs`    | Search string under cursor, respecting .gitignore | telescope.nvim  |
|                 | *Autocomplete*                                    |                 |
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
