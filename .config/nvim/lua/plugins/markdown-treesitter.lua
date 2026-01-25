return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.treesitter.query.set(
        "markdown",
        "highlights",
        [[
          ; Disable conceal on code fences
          [
            (fenced_code_block_delimiter)
          ] @punctuation.delimiter
        ]]
      )
      return opts
    end,
  },
}
