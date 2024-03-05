require("config.KeyMapping.init")
require("config.Setup.init")
require("config.LazyPlugins.init")

-- theme

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


require("notify")("configuration loaded . . .", "info")
