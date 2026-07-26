return {
  -- Use the ruby-lsp gem installed via mise (not a mason copy).
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          -- Use the mise shim so ruby-lsp runs under each project's own ruby
          -- (resolved from .ruby-version / mise.toml at the project root).
          cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
        },
      },
    },
  },
  -- Don't let mason try to install/build ruby-lsp; use the mise gem.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "ruby-lsp"
      end, opts.ensure_installed)
    end,
  },
}
