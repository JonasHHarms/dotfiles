vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Search str in directory' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Open buffers' })
vim.keymap.set('n', '<leader>h', builtin.oldfiles, { desc = 'Prev Open Files' })


vim.keymap.set('n', '<PageUp>', 'zz <C-u>')
vim.keymap.set('n', '<PageDown>', 'zz <C-d>')
