return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      local filtered = vim.tbl_filter(function(source)
        return source.name ~= "luasnip"
      end, opts.sources)
      opts.sources = filtered
      return opts
    end,
  },
  -- Optionally disable friendly-snippets entirely (LuaSnip stays for cmp)
  { "rafamadriz/friendly-snippets", enabled = false },
}
