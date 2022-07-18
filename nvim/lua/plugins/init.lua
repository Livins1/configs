
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Theme
	-- use 'EdenEast/nightfox.nvim'
	use("folke/tokyonight.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

    use({'mhartington/formatter.nvim'})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"neovim/nvim-lspconfig",
		--[[ requires = {
            {'ms-jpq/coq_nvim', branch = 'coq'},
            {'ms-jpq/coq.artifacts', branch = 'artifacts'},
        }, ]]
	})


	-- Cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp", -- Source nvim lsp
			-- 'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
		},
	})


	-- use({ "windwp/nvim-autopairs" })
	--[[ use({
		"windwp/nvim-ts-autotag",
	}) ]]

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("lukas-reineke/indent-blankline.nvim")

	-- use 'beauwilliams/statusline.lua'

	-- One key comment
	use("b3nj5m1n/kommentary")
	--  Symbolsd outline
	-- use("simrat39/symbols-outline.nvim")
	--  Diagnostics
	use("folke/lsp-colors.nvim")
	use("folke/lsp-trouble.nvim")
	--
	--
	if packerBootstrap then
		require("packer").sync()
	end
end)
