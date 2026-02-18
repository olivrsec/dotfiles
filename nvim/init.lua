local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "       
vim.g.maplocalleader = " "

vim.opt.number = true       
vim.opt.relativenumber = false
vim.opt.mouse = "a"         
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true  
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.updatetime = 50

require("lazy").setup({
    -- THEME: Vesper
   {
  "gambhirsharma/vesper.nvim",
  lazy = false,
  priority = 1000,
  name = "vesper",
  config = function ()
   vim.cmd([[colorscheme vesper]])
  end
}, 

    -- discord rpc
    {
        "andweeb/presence.nvim",
        opts = {
            auto_update = true,
            neovim_image_text = "The One True Editor",
            main_image = "neovim",
        }
    },

    -- smooth typing
    {
        "sphamba/smear-cursor.nvim",
        opts = {
		stiffness = 0.5,
    		trailing_stiffness = 0.5,
    		matrix_pixel_threshold = 0.5,
	},
    },

    -- i3wm integration
    {
        "tom-anders/easy-i3-neovim-nav",
        config = function()
            
        end
    },

    -- telescope (fuzzy finder)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Search) Text" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        },
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "c", "python", "bash", "javascript" },
                highlight = { enable = true },
            })
        end
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
})

local keymap = vim.keymap.set

-- fast Save/Quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- clear search highlighting with Esc
keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear Highlights" })

-- window Navigation (Matches i3 movement)
keymap("n", "<C-h>", ":EasyI3FocusLeft<CR>",  { silent = true })
keymap("n", "<C-j>", ":EasyI3FocusDown<CR>",  { silent = true })
keymap("n", "<C-k>", ":EasyI3FocusUp<CR>",    { silent = true })
keymap("n", "<C-l>", ":EasyI3FocusRight<CR>", { silent = true })

-- better Indenting (Stay in visual mode after indenting)
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
