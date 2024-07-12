return {
  "FabijanZulj/blame.nvim",
  keys = {
    { "<leader>gg", "<cmd>BlameToggle<cr>", desc = "Toggle Blame" },
  },
  config = function()
    require("blame").setup()
  end
}
