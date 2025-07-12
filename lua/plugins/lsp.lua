return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason.setup({ ui = opts.ui })

    -- Extraemos los nombres de los servidores a instalar
    local servers_to_install = vim.tbl_keys(opts.servers)

    mason_lspconfig.setup({
      ensure_installed = servers_to_install,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        local server_opts = opts.servers[server_name] or {}
        lspconfig[server_name].setup(server_opts)
      end,
    })

    -- Configuración adicional para los servidores LSP
    -- Java server configuration
    require("lspconfig").jdtls.setup({})
  end,
}
