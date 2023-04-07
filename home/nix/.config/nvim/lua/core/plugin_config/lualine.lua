require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'rose-pine',
    theme = 'nightfly',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
