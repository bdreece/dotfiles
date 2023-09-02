vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = "*",
    callback = function(args)
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.cmd.file("zsh (" .. args.buf .. ")")
    end
})
