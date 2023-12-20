local highlight = {
    RainbowRed = "#E06C75",
    RainbowYellow = "#E5C07B",
    RainbowBlue = "#61AFEF",
    RainbowOrange = "#D19A66",
    RainbowGreen = "#98C379",
    RainbowViolet = "#C678DD",
    RainbowCyan = "#56B6C2",
}

-- Validate that 'highlight' is not empty
if not next(highlight) then
    error("indent-blankline configuration error: 'highlight' table is empty")
end

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", {
        fg = highlight.RainbowRed
    })
    -- Other highlight setups...

end)

require("ibl").setup {
    indent = {
        highlight = highlight
    }
}