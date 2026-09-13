-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use intelephense instead of phpactor (no local PHP needed)
vim.g.lazyvim_php_lsp = "intelephense"

-- LazyVim enables spellcheck for markdown via a FileType autocmd defined very
-- late in startup, so it always wins on FileType/BufReadPost. BufWinEnter fires
-- after the whole FileType chain, so it beats wrap_spell deterministically.
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype) then
      vim.wo.spell = false
    end
  end,
})
