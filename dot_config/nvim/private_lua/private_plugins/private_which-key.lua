-- Press Space (or g, z, ", etc.) and wait: a popup lists what you can type
-- next. Every keymap with a desc = '...' shows up here by that name.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>f', group = 'Find' },
    },
  },
}
