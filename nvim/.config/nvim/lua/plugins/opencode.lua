return {
  "sudo-tee/opencode.nvim",
  event = "VeryLazy",
  build = function()
    local ok, _ = pcall(vim.cmd, "Opencode initialize")
    if not ok then
      vim.notify("opencode.nvim: Failed to initialize AGENTS.md", vim.log.levels.WARN)
    end
  end,
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "opencode_output" },
    },
  },
  config = function()
    require("opencode").setup({
      preferred_picker = nil,
      preferred_completion = nil,
      default_mode = "build",
      keymap_prefix = "<leader>o",
      opencode_executable = "opencode",
      server = {
        url = "localhost",
        port = 4096,
        timeout = 5,
      },
      ui = {
        position = "right",
        input_position = "bottom",
        window_width = 0.40,
        zoom_width = 0.8,
        display_model = true,
        display_context_size = true,
        display_cost = true,
        persist_state = true,
        icons = {
          preset = "nerdfonts",
          overrides = {},
        },
        output = {
          filetype = "opencode_output",
          tools = {
            show_output = true,
            show_reasoning_output = true,
            use_folds = true,
            folding_threshold = 25,
            fold_exclude = {
              "bash",
              { server = "sequential-thinking", tool = "sequentialthinking" },
            },
          },
          rendering = {
            markdown_debounce_ms = 250,
          },
        },
        input = {
          min_height = 0.10,
          max_height = 0.25,
          text = {
            wrap = false,
          },
          auto_hide = false,
        },
      },
      context = {
        enabled = true,
        current_file = {
          enabled = true,
          show_full_path = true,
        },
        files = {
          enabled = true,
          show_full_path = true,
        },
        selection = {
          enabled = true,
        },
        cursor_data = {
          enabled = false,
          context_lines = 5,
        },
        diagnostics = {
          info = false,
          warning = true,
          error = true,
          only_closest = false,
        },
        git_diff = {
          enabled = false,
        },
      },
      logging = {
        enabled = false,
        level = "warn",
      },
      debug = {
        enabled = false,
        capture_streamed_events = false,
        show_ids = true,
      },
      quick_chat = {
        default_model = nil,
        instructions = nil,
      },
    })
  end,
}