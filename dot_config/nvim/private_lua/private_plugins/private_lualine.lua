-- Statusline at the bottom: mode, git branch, file name, position.
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- One statusline for the whole screen instead of one per split.
    options = { globalstatus = true },
  },
}
