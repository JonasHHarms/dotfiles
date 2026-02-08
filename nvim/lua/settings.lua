
-- Windowsettings
vim.o.mouse = v
vim.o.mousescroll= "ver:0,hor:0"
vim.o.visualbell = true
vim.o.showtabline = 0
vim.o.splitright = true
vim.o.background = "dark"
vim.o.ttyfast = true

-- design etc
vim.o.cursorline = true 
vim.o.cursorcolumn = false 
vim.o.signcolumn = "number" 
vim.o.relativenumber = true 
vim.o.number = true 
vim.o.termguicolors = true 
vim.api.nvim_set_hl(0, "Normal", { ctermbg = 0 })
vim.o.signcolumn = 'yes'
vim.o.sidescrolloff = 8
vim.o.scrolloff = 8
vim.o.winborder = "rounded"

-- Statusline
vim.o.showmode = true
vim.o.shortmess = "mrwtTAI"

-- Text
vim.o.smartindent = true 
vim.o.tabstop = 4 
vim.o.spell = true
vim.o.spelllang = "en,de"
vim.o.spelloptions = "camel"
vim.o.syntax = "on"
vim.o.wrap = false 
--vim.o.autocomplete = false --plugin does that
vim.o.pumblend = 0
vim.o.showfulltag = true
vim.o.shiftwidth = 4 
vim.o.expandtab = true 
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.list = true
vim.opt.showmatch = true
vim.o.emoji = true



-- searching
vim.o.ignorecase = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- navigation
vim.o.startofline = true
vim.o.scrolloff = 3

-- filesysystem
vim.o.swapfile = false
vim.o.cdhome = true
vim.o.confirm = true
vim.opt.undofile = true
