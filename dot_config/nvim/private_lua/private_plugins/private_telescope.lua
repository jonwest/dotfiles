-- Fuzzy finder, like Sublime's Ctrl+P. Type part of a name, Enter opens it,
-- Esc closes. Text search uses ripgrep (already in your package list).
return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find file' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Search text in project' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find open file' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Search Neovim help' },
  },
}
