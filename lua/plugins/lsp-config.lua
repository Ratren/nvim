return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "marksman", "arduino_language_server", "hls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        cmd = {
          "/home/rat/CLANGD/llvm/build/bin/clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--compile-commands-dir=build",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })
      lspconfig.arduino_language_server.setup({
        capabilities = capabilities,
      })
      lspconfig.angularls.setup({
        capabilities = capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.hls.setup({
        capabilities = capabilities
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>e", "<cmd> lua vim.diagnostic.open_float()<CR>", {})
    end,
  },
}
