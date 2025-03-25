return {
  "j-hui/fidget.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  after = "nvim-lspconfig",

  config = function()
    require("fidget").setup {}
  end,
}
