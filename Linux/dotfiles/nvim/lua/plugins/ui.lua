return {
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("nightfly")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.startify")

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lualine = require("lualine")
            local lazy_status = require("lazy.status") -- to configure lazy pending updates count

            local colors = {
                blue = "#65D1FF",
                green = "#3EFFDC",
                violet = "#FF61EF",
                yellow = "#FFDA7B",
                red = "#FF4A4A",
                fg = "#c3ccdc",
                bg = "#112638",
                inactive_bg = "#2c3043",
            }

            local my_lualine_theme = {
                normal = {
                    a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                    b = { bg = colors.bg, fg = colors.fg },
                    c = { bg = colors.bg, fg = colors.fg },
                },
                insert = {
                    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                    b = { bg = colors.bg, fg = colors.fg },
                    c = { bg = colors.bg, fg = colors.fg },
                },
                visual = {
                    a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                    b = { bg = colors.bg, fg = colors.fg },
                    c = { bg = colors.bg, fg = colors.fg },
                },
                command = {
                    a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                    b = { bg = colors.bg, fg = colors.fg },
                    c = { bg = colors.bg, fg = colors.fg },
                },
                replace = {
                    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                    b = { bg = colors.bg, fg = colors.fg },
                    c = { bg = colors.bg, fg = colors.fg },
                },
                inactive = {
                    a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                    b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                    c = { bg = colors.inactive_bg, fg = colors.semilightgray },
                },
            }

            -- configure lualine with modified theme
            lualine.setup({
                options = {
                    theme = my_lualine_theme,
                },
                sections = {
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                    },
                },
            })
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                --	command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
