require("startup").setup({
    options = {
        mapping_keys = true, -- display mapping (e.g. <leader>ff)
        cursor_column = 0.5,
        border = {
            { "╭", "FloatBorder" }, -- the border option is the same as `|help nvim_open_win|`
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        },
        content = function()
            local clock = " " .. os.date "%H:%M"
            local date = " " .. os.date "%d-%m-%y"
            return { clock, date }
        end,
        type = "text",                       -- or 'text' | 'bar' | 'percent'
        preview_height = 0.5,                -- max height of preview windows
        preview_width = 0.5,                 -- max width of preview windows
        empty_lines_between_mappings = true, -- add an empty line between mapping/commands
        disable_statuslines = true,          -- disable status-, buffer- and tablines
        paddings = { 1, 2 },                 -- amount of empty lines before each section (must be equal to amount of sections)
    },
    plugins = {
        {
            name = "nvim-telescope/telescope.nvim",
            setup = function()
                require("telescope").load_extension("projects")
            end,
            config = function()
                require("telescope").setup(
                    {
                        defaults = {
                            file_sorter = require("telescope.sorters").get_fzy_sorter,
                            prompt_prefix = "   ",
                            color_devicons = true,
                            file_ignore_patterns = { "node_modules", ".git" },
                            layout_strategy = "flex",
                            layout_config = {
                                flex = {
                                    flip_columns = 130
                                }
                            }
                        },
                        extensions = {
                            projects = {
                                base_dirs = {
                                    "~/Documents/Projects",
                                    "~/Documents/Projects/Personal",
                                    "~/Documents/Projects/Work"
                                }
                            }
                        }
                    }
                )
            end
        }
    }
})


require "startup".create_mappings({
    ["<leader>ff"] = "<cmd>Telescope find_files<CR>",
    ["<leader>lg"] = "<cmd>Telescope live_grep<CR>"
})
