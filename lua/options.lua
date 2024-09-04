require "nvchad.options"

local o = vim.o

-- enable cursor line
o.cursorlineopt = "both"

-- enable relative number
o.number = true
o.relativenumber = true

-- enable line wrap and breka indent
o.wrap = true
o.breakindent = true

-- tab options
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- scrolloff options
o.scrolloff = 8

-- change shell to pwsh
vim.cmd [[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
]]
