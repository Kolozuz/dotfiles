return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    config = function()
        require "configs.dashboard-nvim-conf"
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    opts={
      highlight_groups = "dark"
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "williamboman/mason.nvim",
    opts={
      ensure_installed = {
        "pyright"
      }
    }
  }
};

