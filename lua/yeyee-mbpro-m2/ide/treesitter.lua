require('nvim-treesitter.configs').setup {
  ensure_installed = {
        "go",
        "json",
        "bash",
        "python",
        "c",
        "cpp",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  ignore_install = {},

  highlight = {
    enable = true,
    disable = {
      'help',
      'lua',
    },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled ().
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = {
      'python',
      'javascript',
      'typescript',
      'html',
      'css',
      'javascriptreact',
      'typescriptreact',
      'go',
      'help',
      'lua',
    },
  },
}
