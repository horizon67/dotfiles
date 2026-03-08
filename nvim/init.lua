-- ============================================================
-- 基本設定
-- ============================================================
vim.g.mapleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = false
vim.opt.history = 1000
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- ファイルタイプ別インデント
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "python", "go", "scala", "json", "zsh" },
  callback = function() vim.opt_local.shiftwidth = 4; vim.opt_local.tabstop = 4 end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function() vim.opt_local.expandtab = false end,
})

-- ============================================================
-- lazy.nvim のブートストラップ
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- プラグイン
-- ============================================================
require("lazy").setup({

  -- カラースキーム
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function() vim.cmd("colorscheme tokyonight-night") end,
  },

  -- ファイルツリー
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    keys = { { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" } },
    opts = {
      filesystem = {
        filtered_items = { hide_dotfiles = false },
        follow_current_file = { enabled = true },
      },
    },
  },

  -- ファジーファインダー
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    },
  },

  -- シンタックスハイライト（treesitterで一元管理）
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      configs.setup({
        ensure_installed = { "lua", "ruby", "typescript", "javascript", "python", "vue", "elixir", "terraform" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- Goを使う場合は "gopls" を追加
      ensure_installed = { "ts_ls", "solargraph", "elixirls", "pyright" },
      handlers = {
        function(server)
          require("lspconfig")[server].setup({})
        end,
      },
    },
  },

  -- 補完
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- ステータスライン
  { "nvim-lualine/lualine.nvim", opts = { theme = "tokyonight" } },

  -- Git
  "tpope/vim-fugitive",

  -- Rails
  "tpope/vim-rails",

  -- which-key（キーバインド一覧）
  { "folke/which-key.nvim", config = true },

})

-- ============================================================
-- LSP キーマップ
-- ============================================================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

-- ============================================================
-- その他
-- ============================================================
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左ウィンドウへ" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右ウィンドウへ" })
