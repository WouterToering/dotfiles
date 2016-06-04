require('packer').startup(function()
	 -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	 -- Themes and UI plugins
	use 'alexblackie/lunarised'
	use 'hoob3rt/lualine.nvim'
	use 'airblade/vim-gitgutter'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'preservim/nerdtree'
  use { 'junegunn/fzf.vim', requires = { { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end } } }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require('lualine').setup({
	options = {
		theme = 'lunarised',
		padding = 1,
		section_separators = {'', ''},
		component_separators = {'', ''},
	},
	sections = {
		lualine_a = { { 'mode', lower = true } },
		lualine_b = { 'branch' },
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { },
		lualine_y = { 'filetype' },
		lualine_z = { 'location' },
	},
	extensions = { },
})

require('nvim-treesitter.configs').setup({
	ensure_installed = 'maintained',
	ignore_install = { },
	highlight = { enable = true },
})

vim.g.coc_global_extensions = {
	'coc-go',
	'coc-html',
	'coc-sh',
  'coc-pyright',
  'coc-json'
}
