local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ layout_config = { preview_width = 0.6 } })
end)

vim.keymap.set('n', '<leader>ps', function()
    builtin.treesitter({ layout_config = { preview_width = 0.6 } })
end)

vim.keymap.set('n', '<leader>pg', function()
    builtin.live_grep({ layout_config = { preview_width = 0.6  } })
end)

vim.keymap.set('n', '<leader>;', function()
    builtin.command_history({ layout_strategy = 'center' })
end)

