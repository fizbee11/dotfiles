return {
  'SuperBo/fugit2.nvim',
  build = false,
  opts = {
    width = 100,
    libgit2_path = '/usr/lib/x86_64-linux-gnu/libgit2.so.1.7',
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    {
      'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
      dependencies = { 'stevearc/dressing.nvim' }
    },
  },
  cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph', 'Fugit2Rebase' },
  keys = {
    { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' }
  }
}
