local options = {
  open_mapping = [[<c-t>]],
  size = 10,
  start_in_instert = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = "pwsh",
  shade_terminals = false,
  highlights = {
    Normal = {
      guibg = "#191828",
    },
    NormalFloat = {
      guibg = "#191828",
    },
  },
}

require("toggleterm").setup(options)
