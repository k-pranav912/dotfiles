local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 0,                           -- keep the commandline log minimal
--  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    incsearch = true,                        -- incremental regex-like search
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
--    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = false,                   -- set term gui colors (most terminals support this)
    timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = false,                        -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = false,                      -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                             -- display lines as one long line
    scrolloff = 999,                         -- set cursor to alawys have {n} lines below and above
    sidescrolloff = 8,
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    laststatus  = 2,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end


-- autocmd to add empty lines below EOF to keep cursor centered
-- this with scrolloff = 999 ensures both mouse and keyboard scrolling is consistent
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = "Center cursor",
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  callback = function()
    local mode = vim.fn.mode(1)
    if mode == "i" then
      return
    end
    vim.cmd "normal! zz"
  end,
})
