-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Easy commenting plugin
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      -- Basic configuration, automatically detects comment strings for different file types
    },
  },
}
