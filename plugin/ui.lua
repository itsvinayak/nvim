

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false
        }
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async"
    },
    {"folke/neodev.nvim"},
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 120, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                }
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0 -- turn off the statusline in zen mode
                },
                twilight = {
                    enabled = true
                }, -- enable to start Twilight when zen mode opens
                gitsigns = {
                    enabled = false
                }, -- disables git signs
                tmux = {
                    enabled = false
                }, -- disables the tmux statusline
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = false,
                    font = "+4" -- font size increment
                },
                -- this will change the font size on alacritty when in zen mode
                -- requires  Alacritty Version 0.10.0 or higher
                -- uses `alacritty msg` subcommand to change font size
                alacritty = {
                    enabled = false,
                    font = "14" -- font size
                },
                -- this will change the font size on wezterm when in zen mode
                -- See alse also the Plugins/Wezterm section in this projects README
                wezterm = {
                    enabled = false,
                    -- can be either an absolute font size or the number of incremental steps
                    font = "+4" -- (10% increase per step)
                }
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win)
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end
        }
    },
    {"rcarriga/nvim-notify"},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = {
            theme = 'auto', -- lualine theme
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {     -- Filetypes to disable lualine for.
                statusline = {},       -- only ignores the ft for statusline.
                winbar = {},           -- only ignores the ft for winbar.
            },

            ignore_focus = {},         -- If current filetype is in this list it'll
                                       -- always be drawn as inactive statusline
                                       -- and the last window will be drawn as active statusline.
                                       -- for example if you don't want statusline of
                                       -- your file tree / sidebar window to have active
                                       -- statusline you can add their filetypes here.

            always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
                                         -- can't take over the entire statusline even
                                         -- if neither of 'x', 'y' or 'z' are present.

            globalstatus = false,        -- enable global statusline (have a single statusline
                                         -- at bottom of neovim instead of one for  every window).
                                         -- This feature is only available in neovim 0.7 and higher.

            refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
              statusline = 1000,         -- The refresh option sets minimum time that lualine tries
              tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
              winbar = 1000              -- arises that lualine needs to refresh itself before this time
                                         -- it'll do it.

                                         -- Also you can force lualine's refresh by calling refresh function
                                         -- like require('lualine').refresh()
            }
          },
          sections = {
            lualine_a = {
              {
                'mode',
                icons_enabled = true, -- Enables the display of icons alongside the component.
                -- Defines the icon to be displayed in front of the component.
                -- Can be string|table
                -- As table it must contain the icon as first entry and can use
                -- color option to custom color the icon. Example:
                -- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}

                -- icon position can also be set to the right side from table. Example:
                -- {'branch', icon = {'', align='right', color={fg='green'}}}
                icon = nil,

                separator = nil,      -- Determines what separator to use for the component.
                                      -- Note:
                                      --  When a string is provided it's treated as component_separator.
                                      --  When a table is provided it's treated as section_separator.
                                      --  Passing an empty string disables the separator.
                                      --
                                      -- These options can be used to set colored separators
                                      -- around a component.
                                      --
                                      -- The options need to be set as such:
                                      --   separator = { left = '', right = ''}
                                      --
                                      -- Where left will be placed on left side of component,
                                      -- and right will be placed on its right.
                                      --

                cond = nil,           -- Condition function, the component is loaded when the function returns `true`.

                draw_empty = false,   -- Whether to draw component even if it's empty.
                                      -- Might be useful if you want just the separator.

                -- Defines a custom color for the component:
                --
                -- 'highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' } | function
                -- Note:
                --  '|' is synonymous with 'or', meaning a different acceptable format for that placeholder.
                -- color function has to return one of other color types ('highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' })
                -- color functions can be used to have different colors based on state as shown below.
                --
                -- Examples:
                --   color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
                --   color = { fg = 204 }   -- When fg/bg are omitted, they default to the your theme's fg/bg.
                --   color = 'WarningMsg'   -- Highlight groups can also be used.
                --   color = function(section)
                --      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
                --   end,
                color = nil, -- The default is your theme's color for that section and mode.

                -- Specify what type a component is, if omitted, lualine will guess it for you.
                --
                -- Available types are:
                --   [format: type_name(example)], mod(branch/filename),
                --   stl(%f/%m), var(g:coc_status/bo:modifiable),
                --   lua_expr(lua expressions), vim_fun(viml function name)
                --
                -- Note:
                -- lua_expr is short for lua-expression and vim_fun is short for vim-function.
                type = nil,

                padding = 1, -- Adds padding to the left and right of components.
                             -- Padding can be specified to left or right independently, e.g.:
                             --   padding = { left = left_padding, right = right_padding }

                fmt = nil,   -- Format function, formats the component's output.
                             -- This function receives two arguments:
                             -- - string that is going to be displayed and
                             --   that can be changed, enhanced and etc.
                             -- - context object with information you might
                             --   need. E.g. tabnr if used with tabs.
                on_click = nil, -- takes a function that is called when component is clicked with mouse.
                             -- the function receives several arguments
                             -- - number of clicks in case of multiple clicks
                             -- - mouse button used (l(left)/r(right)/m(middle)/...)
                             -- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
              }
            },
            lualine_b = {
                {
                  'diagnostics',

                  -- Table of diagnostic sources, available sources are:
                  --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                  -- or a function that returns a table as such:
                  --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                  sources = { 'nvim_diagnostic', 'coc' },

                  -- Displays diagnostics for the defined severity types
                  sections = { 'error', 'warn', 'info', 'hint' },

                  diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                  },
                  symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                  colored = true,           -- Displays diagnostics status in color if set to true.
                  update_in_insert = false, -- Update diagnostics in insert mode.
                  always_visible = false,   -- Show diagnostics even if there are none.
                }
            },
            lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" },
            lualine_x = {
                  {
                    'tabs',
                    tab_max_length = 40,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
                    max_length = vim.o.columns / 3, -- Maximum width of tabs component.
                                                    -- Note:
                                                    -- It can also be a function that returns
                                                    -- the value of `max_length` dynamically.
                    mode = 0, -- 0: Shows tab_nr
                              -- 1: Shows tab_name
                              -- 2: Shows tab_nr + tab_name

                    path = 0, -- 0: just shows the filename
                              -- 1: shows the relative path and shorten $HOME to ~
                              -- 2: shows the full path
                              -- 3: shows the full path and shorten $HOME to ~

                    -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
                    use_mode_colors = false,

                    tabs_color = {
                      -- Same values as the general color option can be used here.
                      active = 'lualine_{section}_normal',     -- Color for active tab.
                      inactive = 'lualine_{section}_inactive', -- Color for inactive tab.
                    },

                    show_modified_status = true,  -- Shows a symbol next to the tab name if the file has been modified.
                    symbols = {
                      modified = '[+]',  -- Text to show when the file is modified.
                    },

                    fmt = function(name, context)
                      -- Show + if buffer is modified in tab
                      local buflist = vim.fn.tabpagebuflist(context.tabnr)
                      local winnr = vim.fn.tabpagewinnr(context.tabnr)
                      local bufnr = buflist[winnr]
                      local mod = vim.fn.getbufvar(bufnr, '&mod')

                      return name .. (mod == 1 and ' +' or '')
                    end
                  }
            }
          }
    }
}
