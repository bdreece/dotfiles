require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
    integrations = {
        cmp = true,
        treesitter = true,
    },
    custom_highlights = function(colors)
        return {
            LineNr = { fg = colors.overlay0 },
        }
    end
})

vim.cmd.colorscheme "catppuccin"
