-- Sidebar file browser, like Sublime's folder pane.
-- Space e toggles it. Inside the tree: Enter opens, a adds a file
-- (end the name with / for a folder), r renames, d deletes, ? lists every key.
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- file icons (needs a Nerd Font)
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle reveal<cr>', desc = 'File tree' },
  },
  opts = {
    filesystem = {
      -- Highlight the file you're editing in the tree.
      follow_current_file = { enabled = true },
      -- Show dotfiles and gitignored files, dimmed, instead of hiding them.
      filtered_items = { visible = true },
    },
  },
}
