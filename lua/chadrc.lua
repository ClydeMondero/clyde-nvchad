---@type ChadrcConfig
local M = {}

M.ui = {
  hl_add = {},
  hl_override = {
    NvDashAscii = {
      fg = "pink",
      bg = "black",
    },
  },
  theme = "catppuccin",
  tabufline = {
    enabled = true,
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "          ／l、             ",
      "        （ﾟ､ ｡ ７           ",
      "          l  ~ヽ,           ",
      "          じしf_,)ノ        ",
    },
    buttons = {
      { "  Explorer", "Spc e", "File Explorer" },
      { "  Find File", "Spc f f", "Telescope find_files " },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    },
  },
}

return M
