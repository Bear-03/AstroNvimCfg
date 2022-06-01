local function get_custom_styles(palette)
    return {
        -- Treesitter
        TSVariable = { fg = palette.blue },
        TSParameter = { fg = palette.blue },
        TSField = { fg = palette.fg0 }, -- Attributes
        -- TSFunction = { fg = palette.fg0 },
        TSConstant = { link = "TSNumber" },
        TSConstBuiltin = { link = "TSConstant" },
        TSVariableBuiltin = { fg = palette.grey1 }, -- ex. self / this
        rustTSPunctBracket = { fg = palette.red }, -- For closures in rust
        TSOperator = { fg = palette.aqua },

        -- Other
        VertSplit = { fg = palette.bg2 }, -- General vertical splits (e.g. PackerSync prompt borders)

        -- Prompt menu (e.g. LSP autocompletion menu)
        PmenuThumb = { bg = palette.fg0 }, -- Scroll indicator
    }
end

return function()
    local style = "original"

    require("gruvqueen").setup({
        config = {
            style = style,
            bg_color = "#1d2021",
        },
    })

    -- Palette comes split into common, material, mix and original
    local split_palette = require("gruvqueen.palette").get_dark_theme_palette()
    local palette = vim.tbl_deep_extend("force", split_palette.common, split_palette[style])

    for group, value in pairs(get_custom_styles(palette)) do
        vim.api.nvim_set_hl(0, group, value)
    end
end

