-- require("mason").setup()

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'html', 'astro', 'svelte', 'tsserver', 'intelephense'  }
