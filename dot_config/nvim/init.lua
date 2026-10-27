-- Leader key ------------------------------------------------------------------
-- The leader is a prefix for your own shortcuts, so they never clash with
-- Vim's built-in keys. It has to be set before any mapping that uses it.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers ----------------------------------------------------------------
-- Hybrid numbers: the cursor line shows its real number (matches error
-- messages and `:42`), every other line shows its distance from the cursor
-- (read the number, then type e.g. `7j` or `d7j`).
vim.o.number = true
vim.o.relativenumber = true

-- Clipboard -------------------------------------------------------------------
-- Share yank/paste with the system clipboard, so `yy` in Neovim can be
-- pasted in Firefox and vice versa. Needs wl-clipboard on Wayland
-- (`sudo pacman -S wl-clipboard`); check with :checkhealth provider.
-- Side effect: deleting (d, x, c) also replaces the clipboard contents.
-- It is scheduled after startup because finding the clipboard tool can
-- add a few milliseconds to launch time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Search ----------------------------------------------------------------------
-- Lowercase searches ignore case (/foo finds Foo, FOO); any capital letter
-- makes the search exact (/Foo finds only Foo).
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indentation -----------------------------------------------------------------
-- 2 spaces, never tabs. A project's .editorconfig file overrides this
-- automatically, and some languages override it too (Python uses 4).
vim.o.expandtab = true -- pressing Tab inserts spaces
vim.o.shiftwidth = 2   -- width used by >>, << and auto-indent
vim.o.tabstop = 2      -- how wide an existing tab character looks
vim.o.softtabstop = 2  -- Backspace removes 2 spaces at a time

-- Undo ------------------------------------------------------------------------
-- Keep undo history in a file, so `u` still works after you close and
-- reopen a file. Neovim stores these under ~/.local/state/nvim/undo/.
vim.o.undofile = true

-- Scrolling and windows -------------------------------------------------------
-- Keep 8 lines visible above and below the cursor while moving.
vim.o.scrolloff = 8
-- :vsplit opens to the right and :split opens below, like most other apps.
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace ------------------------------------------------------------------
-- Show tabs, trailing spaces and non-breaking spaces as faint symbols.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Mouse -----------------------------------------------------------------------
-- Clicking and scrolling work in every mode. Handy while learning; the
-- goal is to need it less over time, not to ban it.
vim.o.mouse = 'a'

-- Keymaps ---------------------------------------------------------------------
-- Stock Vim keys stay untouched. These are the only additions.

-- Esc in normal mode also clears search highlighting left over from /foo.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Space ? opens the motions cheat sheet in a read-only split on the right.
vim.keymap.set('n', '<leader>?', function()
  vim.cmd.vsplit(vim.fn.stdpath('config') .. '/cheatsheet.md')
  vim.bo.readonly = true
end, { desc = 'Open motions cheat sheet' })
