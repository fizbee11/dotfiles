return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Define the languages you want installed
    local languages = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      
    -- Install parsers
    ts.install(languages)

    -- Enable Neovim's native tree-sitter features via an autocommand
    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function()
        vim.treesitter.start() -- Turns on native syntax highlighting
      end,
    })
  end,
}
