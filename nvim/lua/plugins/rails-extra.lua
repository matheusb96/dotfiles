return {
  -- Rails navigation: :A (alternate file), gf between model/view/controller/partial,
  -- :Emodel/:Eview/:Econtroller, :Rails console, etc.
  {
    "tpope/vim-rails",
    dependencies = {
      "tpope/vim-projectionist",
      "tpope/vim-bundler",
    },
    ft = { "ruby", "eruby", "haml", "slim" },
    cmd = { "Rails", "Emodel", "Eview", "Econtroller", "A", "AV" },
  },

  -- This project uses Minitest (test/ dir), not RSpec. Add the Minitest adapter
  -- so neotest can run/debug tests; the ruby extra's RSpec adapter only matches
  -- *_spec.rb so the two coexist harmlessly.
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "zidhuss/neotest-minitest" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-minitest"] = {
        test_cmd = function()
          return vim.tbl_flatten({ "bin/rails", "test" })
        end,
      }
    end,
  },
}
