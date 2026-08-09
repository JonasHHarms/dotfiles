-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_lua").load({paths = "./snippets"})
        ls.setup({
            keep_roots = true,
            link_roots = true,
            link_children = true,
            enable_autosnippets = true,
            update_events = "TextChanged,TextChangedI",
            delete_check_events = "TextChanged",
        })

    end
},
{ "hrsh7th/nvim-cmp",
dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-omni",
},
config = function()
    local cmp = require('cmp')
    cmp.setup({
        sources = {
            {name = 'omni'},
            {name = 'nvim_lsp'},
            {name = 'path'},
            {name = 'luasnip'},
            {name = 'buffer'},
        },
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end,
        },
        window = {
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {'menu', 'abbr', 'kind'},
            --neu 072026
            format = function(entry, vim_item)
                local highlights_info = require("colorful-menu").cmp_highlights(entry)

            -- highlight_info is nil means we are missing the ts parser, it's
            -- better to fallback to use default `vim_item.abbr`. What this plugin
            -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
                if highlights_info ~= nil then
                    vim_item.abbr_hl_group = highlights_info.highlights
                    vim_item.abbr = highlights_info.text
                end
                return vim_item
                end,
        },
        mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
        view = {
            entries = {name = 'custom', selection_order = 'near_cursor' } 
},
    })
  end,
},
{ "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
  parser = {
    async_chunksize = 50,
    delimiter = {
      ft = { csv = ",", tsv = "\t", },
      fallbacks = { ";", "\t", "|", ":", " ", },
      },
    quote_char = '"',
    comments = { "#", "--", "//", },
    -- The number of lines at the beginning of the file to treat as comments.
    comment_lines = nil,
    -- Max rows b4 inserting linebreak if no delim found
    max_lookahead = 50,
      },
  view = {
    min_column_width = 5,
    spacing = { left = 2, right = 2 },
    display_mode = "border",
    sticky_header = {
      enabled = true,
      separator = "─",
    },
  },
    keymaps = {
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
},
{
  "lervag/vimtex",
  lazy = false,     -- cant lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end
},
{ "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        require('mason').setup()
        local mason_lspconfig = require'mason-lspconfig'
        mason_lspconfig.setup {
            ensure_installed = { "pyright" }
        }
     --   vim.lsp.enable('pyright')
     --   vim.lsp.enable('ast_grep')
     --   vim.lsp.enable('yaml-language-server')
     --   vim.lsp.enable('vim-language-server')
     --   vim.lsp.enable('textlsp')
     --   vim.lsp.enable('textlint')
     --   vim.lsp.enable('tex-fmt')
     --   vim.lsp.enable('systemd-lsp')
     --   vim.lsp.enable('sql-formatter')
     --   vim.lsp.enable('python-lsp-server')
     --   vim.lsp.enable('prettier')
     --   vim.lsp.enable('markdownlint')
     --   vim.lsp.enable('lua-language-server')
     --   vim.lsp.enable('ltex-ls-plus')
     --   vim.lsp.enable('ltex-ls')
     --   vim.lsp.enable('json-lsp')
     --   vim.lsp.enable('jq')
     --   vim.lsp.enable('glow')
     --   vim.lsp.enable('firefox-debug-adapter')
     --   vim.lsp.enable('flake8')
     --   vim.lsp.enable('cssmodules-language-server')
     --   vim.lsp.enable('csskit')
     --   vim.lsp.enable('css-variables-language-server')
     --   vim.lsp.enable('css-lsp cssls')
     --   vim.lsp.enable('colorgen-nvim')
     --   vim.lsp.enable('bibtex-tidy')
    end,
},
{ --kill idle LSPs
"hinell/lsp-timeout.nvim",
dependencies={ "neovim/nvim-lspconfig" }
},
{"nvim-telescope/telescope.nvim", cmd = "Telescope", version = false,
    dependencies = { "nvim-lua/plenary.nvim", 
                     "BurntSushi/ripgrep", 
                     "nvim-tree/nvim-web-devicons", 
                     'nvim-lua/popup.nvim',
                     'nvim-telescope/telescope-media-files.nvim',
                     'jvgrootveld/telescope-zoxide',
                 },
    config = function()
        require'telescope'.load_extension('media_files')
        require'telescope'.load_extension('zoxide')
        require'telescope'.setup({
            extensions = {
                media_files = {
                  filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf"},
                  find_cmd = "rg"
                    },
                zoxide = {
                  prompt_title = "[Zoxide]",
                  mappings = {
                    default = {
                      after_action = function(selection)
                        print("Update to (" .. selection.z_score .. ") " .. selection.path)
                      end
                    }, }, }, 
            },
        })
    end
},
{'mfussenegger/nvim-dap',
    dependencies = {'mfussenegger/nvim-dap-python'},
    config = function()
        local dap = require('dap')
        dap.configurations.python = {
            {
                type = 'python';
                request = 'launch';
                name = "Launch file";
                program = "${file}";
                pythonPath = function()
                    return '/usr/bin/python'
                end;
            },
        }

    end
},
{'nvim-lualine/lualine.nvim',
dependencies = { 'nvim-tree/nvim-web-devicons' },
config = function()
    require('lualine').setup {
        options = {
            icons_enabled = false,
            theme = 'powerline',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
                refresh_time = 16, -- ~60fps
                events = {
                    'WinEnter',
                    'BufEnter',
                    'BufWritePost',
                    'SessionLoadPost',
                    'FileChangedShellPost',
                    'VimResized',
                    'Filetype',
                    'CursorMoved',
                    'CursorMovedI',
                    'ModeChanged',
                },
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'filetype',  'Lsp_status'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
},
{ "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons", },
  config = function()
    require("nvim-tree").setup({
   view = {
	signcolumn = "yes",
	float = {
	    enable = true,
	    open_win_config = open_win_config_func
	},
	cursorline = false
    },
    modified = {
	enable = true
    },
    renderer = {
	indent_width = 3,
	icons = {
	    show = {
		hidden = true
	    },
	    git_placement = "after",
	    bookmarks_placement = "after",
	    symlink_arrow = " -> ",
	    glyphs = {
		folder = {
		    arrow_closed = " ",
		    arrow_open = " ",
		    default = "📁",
		    open = "📂",
		    empty = "📁",
		    empty_open = "📂",
		    symlink = "📁",
		    symlink_open = "📂"
		},
		default = "🗋",
		symlink = "lnk",
		bookmark = "🔖",
		modified = "*🗋",
		hidden = "👻",
		git = {
		    unstaged = "×",
		    staged = "staged",
		    unmerged = "unmerged",
		    untracked = "untracked",
		    renamed = "renamed",
		    deleted = "🕱",
		    ignored = "∅"
		}
	    }
	}
    },
    filters = {
	git_ignored = false
    },
    hijack_cursor = true,
    sync_root_with_cwd = true
    })
  end
},
{ "nvim-tree/nvim-web-devicons", 
  config = function()
    require'nvim-web-devicons'.get_icons()
    require'nvim-web-devicons'.setup({
        color_icons = true,
        default = true,
        })
  end
},

{ "brenton-leighton/multiple-cursors.nvim",
  opts = {},  -- This causes the plugin setup function to be called
  keys = {
    {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
    {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},
    {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
    {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},
    {"<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = {"x"}, desc = "Add cursors to the lines of the visual area"},
    {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
    {"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},
  },
},

--neu 07.26
{ "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
      ---@class wk.Opts
  preset = "helix",
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  filter = function(mapping)
    return true
  end,
  spec = {},
  notify = true,
  triggers = {
    { "<auto>", mode = "nxso" },
  },
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  win = {
    no_overlap = true,
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    bo = {},
    wo = {
        winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  sort = { "local", "order", "group", "alphanum", "mod" },
  expand = 0, -- expand groups when <= n mappings
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    mappings = true,
    rules = {},
    colors = true,
    keys = {
      Up = " ", Down = " ", Left = " ", Right = " ",
      C = "󰘴 ", M = "󰘵 ", D = "󰘳 ", S = "󰘶 ", CR = "󰌑 ",
      Esc = "󱊷 ", ScrollWheelDown = "󱕐 ", ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ", BS = "󰁮", Space = "󱁐 ", Tab = "󰌒 ",
      F1 = "󱊫", F2 = "󱊬", F3 = "󱊭", F4 = "󱊮", F5 = "󱊯", F6 = "󱊰", F7 = "󱊱", F8 = "󱊲", F9 = "󱊳", F10 = "󱊴", F11 = "󱊵", F12 = "󱊶",
    },
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  },
  keys = {
    { "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)", },
  },
},

{ --animations :WhiskEnable
  "josstei/whisk.nvim",
  event = "VeryLazy",
  config = function()
    require("whisk").setup({
        cursor = {
        duration = 150,
        easing = "linear",
        enabled = false,
      },
      scroll = {
        duration = 200,
        easing = "ease-in-out",
        enabled = true,
      },
      keymaps = {
        cursor = false,
        scroll = true,
      },
      performance = {
        enabled = false,
        disable_syntax_during_scroll = false,
        reduce_frame_rate = false,
        frame_rate_threshold = 360,
        auto_enable_on_large_files = true,
        large_file_threshold = 5000,
      },
    })
  end,
},
{ -- infos at the end of closing bracets
  'code-biscuits/nvim-biscuits',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
  default_config = {
    max_length = 12,
    min_distance = 5,
    prefix_string = " 📎 ",
    mode = "n",
    cursor_line_only = true,
  },

},},
  
{ --linenumer is colored with mode
  'mawkler/modicator.nvim',
  init = function()
    -- These are required 
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {   show_warnings = false, }
},
{ "xzbdmw/colorful-menu.nvim", },
--{ "LintaoAmons/cd-project.nvim", },
{ --errors in line
 "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
},
{ --also inline error desc
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},
{ -- also inline infos
  'Kasama/nvim-custom-diagnostic-highlight',
  config = function()
    require('nvim-custom-diagnostic-highlight').setup {}
  end
},
{ --infos on hover
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	opts = {}
},
{ --also infos on hover
	'LukasPietzschmann/boo.nvim',
	opts = { },
},
    { -- also infos on hover
        "soulis-1256/eagle.nvim",
        config = function()
            require("eagle").setup({
                keyboard_mode = true,
            })
            vim.o.mousemoveevent = true
            vim.keymap.set('n', '<Tab>', ':EagleWin<CR>', { noremap = true, silent = true })
        end,
    },
   
    { --definitions in the curr project
  "error311/wayfinder.nvim",
  opts = {},
},
{-- sidebar
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- Your setup opts here
  },
},
{'lewis6991/gitsigns.nvim'}, -- git markers for changes
{--render images
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
        processor = "magick_cli",
    }
},
{'mfussenegger/nvim-lint'},  --linter
--{'niuiic/todo.nvim'}, --todos
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
  },
  ---@type YaziConfig | {}
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
},
{'kevinhwang91/nvim-hlslens'}, --searching
{'petertriho/nvim-scrollbar'}, --scrollbar
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
  group = highlight_group,
  pattern = '*',
})
vim.treesitter.language.register('latex', { 'tex', 'bib' })
vim.treesitter.language.register('python', 'py' )
