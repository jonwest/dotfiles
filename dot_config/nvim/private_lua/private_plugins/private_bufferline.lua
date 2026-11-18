-- Tab bar across the top. Each tab is an open file (a "buffer" in Neovim
-- terms; Neovim's own :tabs are layouts of windows, not files).
-- Tab / Shift+Tab switch files, Space x closes the current one.
return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  keys = {
    { '<Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next file tab' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous file tab' },
    { '<leader>x', '<cmd>bdelete<cr>', desc = 'Close file tab' },
  },
  opts = {
    options = {
      -- Start the tabs to the right of the file tree, not above it.
      offsets = { { filetype = 'neo-tree', text = 'Files', separator = true } },
    },
  },
}
