require('plugins')

-- Editing

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse='a'
vim.opt.clipboard='unnamed'
vim.opt.swapfile=false
vim.opt.backup=false


-- UI

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = { 72, 88, 100 }
vim.opt.listchars.trail = '·'
vim.opt.listchars.tab = '»'
vim.opt.signcolumn = 'yes'

require('lunarised').load()

-- Keybindings


-- Trigger code completion
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { expr = true, silent = true })

-- Code navigation: Go to definition
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {})
vim.api.nvim_set_keymap('n', ';', ':', {})
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<ESC>', {})

-- navigate buffers with ctrl + hjkl
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', {})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', {})

-- Highlight trailing whitespace
vim.cmd[[autocmd BufWinEnter * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertLeave * match TSWarning /\s\+$/]]
vim.cmd[[autocmd InsertEnter * match TSWarning /\s\+\%#\@<!$/]]

-- Clear whitespace on save
vim.cmd[[autocmd BufWritePre * :%s/\s\+$//e]]

vim.cmd[[
  autocmd FileType python,php setlocal shiftwidth=4 tabstop=4
]]

-- Tab to go through autocomplete options

-- local function t(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- function _G.smart_tab()
--     return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
-- end

-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], {silent = true, expr = true}) -- next selection on autocomplete menu
map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], {silent = true, expr = true}) -- previous selection on autocomplete menu

-- Tabs
map("n", "<Tab>", "gt")
map("n", "<S-Tab>", "gT")
