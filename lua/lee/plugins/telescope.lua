-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- import telescope actions safely
-- local lga_actions_setup, lga_actions = pcall(require, "telescope-live-grep-args.actions")
-- if not lga_actions_setup then
--   return
-- end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
  extension = {
    -- live_grep_args = {
    --   auto_quoting = true, -- enable/disable auto-quoting
    --   -- define mappings, e.g.
    --   mappings = { -- extend mappings
    --     i = {
    --       ["<C-k>"] = lga_actions.quote_prompt(),
    --       ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
    --     },
    --   },
    -- },
    -- media_files = {
    --   -- filetypes whitelist
    --   -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --   filetypes = { "png", "webp", "jpg", "jpeg" },
    --   -- find command (defaults to `fd`)
    --   find_cmd = "rg",
    -- },
  },
})

-- telescope.load_extension("media_files")
telescope.load_extension("fzf")
