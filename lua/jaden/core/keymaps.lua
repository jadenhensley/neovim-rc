vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>") -- exit out of insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") -- deselect the selected words

keymap.set("n", "<leader>+", "<C-a>") -- increment selected number by one while in normal mode
keymap.set("n", "<leader>-", "<C-x>") -- decrement selected number by one while in normal mode.

-- managing window panes

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- managing tabs

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tam
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- VS code keymaps
vim.keymap.set('n', '<F5>', ':lua require"jaden.core.build".openTerm()<CR>', { noremap = true }) -- F5 to build and run
