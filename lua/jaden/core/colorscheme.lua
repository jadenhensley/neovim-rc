vim.cmd("colorscheme nightfly")
--vim.cmd("colorscheme vim-code-dark")

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorscheme not found!")
  return
end
