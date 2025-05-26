-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable transparency
vim.opt.termguicolors = true
vim.opt.winblend = 15      -- Make floating windows slightly transparent
vim.opt.pumblend = 15      -- Make popup menu slightly transparent

-- Force transparency for all backgrounds
vim.cmd([[
  augroup TransparentBG
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NormalNC guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NormalFloat guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight CursorLine guibg=#2c2c2c ctermbg=236
    autocmd ColorScheme * highlight StatusLine guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight StatusLineNC guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight VertSplit guibg=NONE ctermbg=NONE
  augroup END
]])

-- Apply transparency immediately after startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
    vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
    vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
    vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
    vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
    vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
    vim.cmd("hi StatusLineNC guibg=NONE ctermbg=NONE")
    vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")
  end,
})
