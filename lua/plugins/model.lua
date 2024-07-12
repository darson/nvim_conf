return {
      "gsuuon/model.nvim",
      cmd = { "Model", "Mchat" },
      init = function()
          vim.filetype.add({ extension = { mchat = "mchat" } })
      end,
      ft = "mchat",
      keys = { { "<leader>h", ":Model<cr>", mode = "v" } },
      config = function()
          local openai = require("model.providers.openai")
          local util = require("model.util")
          require("model").setup({
              hl_group = "Substitute",
              prompts = util.module.autoload("prompt_library"),
              default_prompt = {
                  provider = openai,
                  options = {
                      url = "http://127.0.0.1:10000/v1/",
                      authorization = "Bearer abc",
                  },
                  builder = function(input)
                      return {
                          model = "GPT-4o",
                          temperature = 0.3,
                          max_tokens = 400,
                          messages = {
                              {
                                  role = "system",
                                  content = "You are helpful assistant.",
                              },
                              { role = "user", content = input },
                          },
                      }
                  end,
              },
          })
      end,
  }
