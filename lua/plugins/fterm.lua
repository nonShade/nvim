return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    require("FTerm").setup({
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })
  end,

  vim.keymap.set("n", "<leader>tf", function()
    require("FTerm").toggle()
  end, { desc = "Toggle FTerm" }),
}
