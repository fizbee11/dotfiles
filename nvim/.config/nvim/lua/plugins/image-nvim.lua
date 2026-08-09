return {
  "3rd/image.nvim",
  event = "FileType markdown",
  dependencies = {
    "vhyrro/luarocks.nvim",
  },
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_visual_mode = false,
        name = "markdown",
      },
      neorg = {
        enabled = false,
        name = "neorg",
      },
      yaml = {
        enabled = false,
        name = "yaml",
      },
      coc = {
        enabled = false,
        name = "coc",
      },
      neovim = {
        enabled = false,
        name = "nvim",
      },
      default = {
        enabled = false,
        name = "default",
      },
    },
    renderer = {
      enabled = true,
      max_width = 80,
      max_height = 20,
      cache_enabled = true,
    },
    window = {
      border = "single",
      win_options = {
        winhighlight = "NormalFloat: Normal,FloatBorder: FloatBorder",
      },
    },
    client = {
      path = "",
      args = {},
      env = {},
    },
    filter = {
      path = "",
      args = {},
      env = {},
    },
    formatter = {
      enabled = false,
      path = "",
      args = {},
      env = {},
    },
    tmux_show_only_in_active_window = true,
    debug = false,
    rocks = {
      enabled = true,
      hererocks = false,
    },
  },
}