return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    vim.o.foldcolumn = "1" -- Mostrar columna de plegado
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local ufo = require("ufo")

    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)
    vim.keymap.set("n", "zK", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold" })

    ufo.setup({
      provider_selector = function(_, _, _)
        return { "lsp", "indent" }
      end,
    })
  end,
}
