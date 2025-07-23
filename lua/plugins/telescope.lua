return {
    {
      "nvim-telescope/telescope.nvim",
      version = false, -- 최신 커밋을 쓰도록 설정
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        local telescope_ok, telescope = pcall(require, "telescope")
        if not telescope_ok then
          vim.notify("Failed to load telescope: " .. tostring(telescope), vim.log.levels.ERROR)
          return
        end
        
        local actions_ok, actions = pcall(require, "telescope.actions")
        if not actions_ok then
          vim.notify("Failed to load telescope.actions: " .. tostring(actions), vim.log.levels.ERROR)
          return
        end

        local media_files_ok, _ = pcall(telescope.load_extension, "media_files")
        if not media_files_ok then
          vim.notify("Failed to load telescope media_files extension", vim.log.levels.WARN)
        end

        telescope.setup({
          defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },

            mappings = {
              i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-h>"] = actions.which_key,
              },

              n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
              },
            },

            layout_config = {
              horizontal = {
                preview_cutoff = 0,
              },
            },
          },
          pickers = {},
          extensions = {
            media_files = {
              filetypes = { "png", "webp", "jpg", "jpeg" },
              find_cmd = "rg",
            },
          },
        })
      end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
