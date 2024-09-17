require "nvchad.mappings"

local map = vim.keymap.set

local unmap = vim.keymap.del

-- remove default mappings
unmap("n", "<leader>h") -- horizontal terminal
unmap("n", "<leader>v") -- vertical terminal
unmap("n", "<leader>ma") -- find marks
unmap("n", "<S-tab>") -- previous buffer
unmap("n", "<tab>") -- next buffer
unmap("n", "<leader>ch") -- cheat sheet

-- remap default mappings
map("n", "<leader>x", ":q <cr>")

-- harpoon maps
local harpoon = require "harpoon"

harpoon:setup()

map("n", "<leader>m", function()
  harpoon:list():add()
end, { desc = "add mark" })
map("n", "<leader>`", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "view marks in harpoon" })

map("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "go to mark 1" })
map("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "go to mark 2" })
map("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "go to mark 3" })
map("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "go to mark 4" })

-- add toggle for lazy git
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "none",
  },
}

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { desc = "toggle lazy git" })

-- set save to ctrl + s
map("n", "<c-s>", ":write <cr>")
map("i", "<c-s>", "<esc> :write <cr>")

-- move highlighted text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- center page navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- go to buffer #
local arr = { "(", ")", "}", "+" }
for i = 1, 4, 1 do
  map("n", string.format("<C-%s>", arr[i]), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("go to buffer %s", arr[i]) })
end

-- Map Ctrl+Tab to go to the previous buffer
vim.api.nvim_set_keymap("n", "<C-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

--
-- -- arrange buffer
-- map("n", "<leader>.", function()
--   require("nvchad.tabufline").move_buf(1)
-- end, { desc = "move buffer to the right" })
-- map("n", "<leader>,", function()
--   require("nvchad.tabufline").move_buf(-1)
-- end, { desc = "move buffer to the left" })
