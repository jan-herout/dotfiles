return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  cmd = "Telescope",
  config = function()
    require("telescope").setup{}
  end
}
