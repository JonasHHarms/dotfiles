-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {'menu', 'abbr', 'kind'}
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
{
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
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
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
        ensure_installed = { "pyright" }
    }
    vim.lsp.enable('pyright')
end,
},
    { "nvim-treesitter/nvim-treesitter", version = false,
    build = false,
    config = function()
        require 'nvim-treesitter.install'.prefer_git = false
        require 'nvim-treesitter.install'.compilers = { "cl", "clang", "gcc", "zig" }
        require("nvim-treesitter.configs").setup({
            auto_install = false,
        })
    end
},
{"nvim-telescope/telescope.nvim", cmd = "Telescope", version = false,
dependencies = { "nvim-lua/plenary.nvim", 
                 "BurntSushi/ripgrep", 
                 "nvim-tree/nvim-web-devicons", 
             },
config = function()
    require'telescope'.setup({ })
end
    },
{'mfussenegger/nvim-dap',
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
{'mfussenegger/nvim-dap-python'},
{'nvim-lualine/lualine.nvim',
dependencies = { 'nvim-tree/nvim-web-devicons' },
config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
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
                lualine_x = {'encoding', 'fileformat', 'filetype'},
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
{
    "nvim-tree/nvim-tree.lua",
    requires = {
        "nvim-tree/nvim-web-devicons",
  },
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
{ "miikanissi/modus-themes.nvim", priority = 1000 },
{ "nvim-tree/nvim-web-devicons", 
  config = function()
    require'nvim-web-devicons'.get_icons()
    require'nvim-web-devicons'.setup({
        color_icons = true,
        default = true,
        })
  end
},
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
  group = highlight_group,
  pattern = '*',
})

