vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'

vim.opt.showmode = false

-- don't sync clipboard when in vscode extension mode
if vim.g.vscode then
	vim.opt.clipboard = ""
end

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- greatest remap ever, paste without overwriting the buffer with currently deleting text
vim.keymap.set("x", "<leader>p", [["_dP]])
-- delete without overwriting the buffer with currently deleting text
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- this will yank to the system clipboard, in normal mode, it yanks the current line
vim.keymap.set("v", "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Function to rename the tmux window based on the buffer name
--local function rename_tmux_window()
--  local bufname = vim.fn.expand '%:t'
-- os.execute('tmux rename-window ' .. vim.fn.shellescape(bufname))
--end

-- Function to rename the tmux window to 'bash' when leaving Vim
--local function rename_tmux_window_to_bash()
--  os.execute 'tmux rename-window bash'
--end

-- Set the titlestring in Lua
local function set_titlestring()
	vim.opt.titlestring = " " .. vim.fn.expand("%:t")
end

-- Autocommands
--vim.api.nvim_create_autocmd('BufEnter', {
--  callback = rename_tmux_window,
--})

--vim.api.nvim_create_autocmd('VimLeave', {
--  callback = rename_tmux_window_to_bash,
--})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = set_titlestring,
})

-- Set title option
vim.opt.title = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
