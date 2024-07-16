return {
  {
    -- https://github.com/kristijanhusak/vim-dadbod-ui
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      {
        'tpope/vim-dadbod',
        lazy = true
      },
      {
        'kristijanhusak/vim-dadbod-completion',
        ft = { 'sql', 'mysql', 'plsql' },
        lazy = true
      },
    },
    keys = {
      { '<leader>D', ':DBUIToggle<CR>', desc = 'Toggle DBUI'},
      { '<leader>dc', ':DBUIAddConnection<CR>', desc = 'Add Connection'},
      { '<leader>df', ':DBUIFindBuffer<CR>', desc = 'Find Buffer'},
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_auto_execute_table_helpers = 0
    end,
  }
}
