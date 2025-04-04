-- Nice tabbing
vim.cmd.set("tabstop=4 softtabstop=0")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")

-- All the colors of the rainbow and how to use them
vim.cmd.set("termguicolors")
vim.cmd.colorscheme("catppuccin")
vim.cmd.set("background=light")

-- Line numbering
vim.cmd.set("number relativenumber")
local numbergroup = vim.api.nvim_create_augroup("numbertoggle", { clear=true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
    {
        pattern = "*",
        group = numbergroup,
        command = "if &nu && mode() != 'i' | set rnu | endif",
        desc = "turn relative numbers on"
    }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
    {
        pattern = "*",
        group = numbergroup,
        command = "if &nu | set nornu | endif",
        desc = "turn relative numbers off"
    }
)

-- Copying to clipboard
vim.cmd.set("clipboard=unnamed,unnamedplus")

-- The statusline
-- Default + git branch: vim.cmd.set("statusline=%<%f\\ %h%w%m%r%=%{FugitiveStatusline()}\\ %-14.(%l,%c%V%)\\ %P")
--- Format lsp-diagnostics
-- Taken straight from https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
local function fmt_lsp_diagnostics()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = " %#DiagnosticVirtualTextError#E " .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = " %#DiagnosticVirtualTextWarn#W " .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = " %#DiagnosticVirtualTextHint#H " .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = " %#DiagnosticVirtualTextInfo#I " .. count["info"]
    end

    return errors .. warnings .. hints .. info
end
fmt_statusline = function(active)
    local branch_col, other_col
    if active then
        branch_col = "%#PmenuSel#"
        other_col = "%#StatusLine#"
    else
        branch_col = "%#StatusLineNC#"
        other_col = "%#StatusLineNC#"
    end
    return table.concat({
        branch_col,
        "%{FugitiveStatusline()}",
        other_col,
        " %f %h%w%m%r",
        "%=",
        fmt_lsp_diagnostics(),
        " ",
        other_col,
        "%-14.(%l,%v%) %P"
    }, "")
end
fmt_statusline_short = function() return "%#StatusLineNC# %f" end
fmt_statusline_active = function() return fmt_statusline(true) end
fmt_statusline_inactive = function() return fmt_statusline(false) end
local statusline_group = vim.api.nvim_create_augroup("statusline", { clear=true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "WinEnter" },
    {
        pattern = "*",
        group = numbergroup,
        callback = function(opts)
            if vim.bo[opts.buf].filetype == "neo-tree" then
                vim.cmd.setlocal("statusline=%!v:lua.fmt_statusline_short()")
            else
                vim.cmd.setlocal("statusline=%!v:lua.fmt_statusline_active()")
            end
        end,
        desc = "Set the statusline for an active window"
    }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "WinLeave" },
    {
        pattern = "*",
        group = numbergroup,
        command = "setlocal statusline=%!v:lua.fmt_statusline_inactive()",
        desc = "Set the statusline for an inactive window"
    }
)
