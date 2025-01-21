-- require "nvchad.mappings"

local map = vim.keymap.set

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
-- map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
-- map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>N", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- map("n", "<leader>x", function()
-- require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
map("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
-- map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "terminal escape terminal mode" })
map("t", "", "<C-\\><C-n>", { desc = "terminal escape terminal mode" })

-- new terminals
-- map("n", "<leader>h", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })

-- map("n", "<leader>v", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

--
map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
--
-- map({ "n", "t" }, "<A-i>", function()
-- require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- add yours here
--
map({ "n", "i", "v", "c" }, "", "<Esc>", { noremap = false, desc = "Remap of CapsLock to Esc" })
map({ "n", "i", "v", "c" }, "<Esc>", "<Esc><cmd>noh<CR>", { noremap = false, desc = "Remap of CapsLock to Esc" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("n", "<C-a>", "gg^vG$", { desc = "general select the whole file" })
map("n", "<C-c>", '"+yy', { desc = "general copy current line" })
map("v", "<C-c>", '"+y', { desc = "general copy selection" })

map("n", "U", "<C-r>", { desc = "undo redo" })

-- map({"n", "i", "v"}, "<C-v>", ) -- general paste
map("n", "<A-v>", "<C-v>", { desc = "enter block visual mode" })

map({ "n", "v" }, "H", "$", { desc = "move to the end of the line ($)" })
map({ "n", "v" }, "L", "0", { desc = "move to the beginning of the line (0)" })
map({ "n", "v" }, "J", "<C-d>", { desc = "big move down" })
map({ "n", "v" }, "K", "<C-u>", { desc = "big move up" })
map("n", "dL", "d$")
map("n", "dH", "d0")
map("n", "cL", "c$")
map("n", "cH", "c0")

map({ "n", "v" }, "'i", "'^", { desc = "go to last insert in buffer ('^)" })
map({ "n", "v" }, "'c", "'.", { desc = "go to last change in buffer ('.)" })

map("n", "<A-j>", ":m .+1<CR>")
map("v", "<A-j>", ":m '>+1<CR>gv")
map("n", "<A-k>", ":m .-2<CR>")
map("v", "<A-k>", ":m '<-2<CR>gv")

map("n", "<A-c>", "J", { desc = "concatenate current lines (join them)" })

_G.increment_value = 1
_G.decrement_value = 1
map("n", "<A-->", "<C-x>", { desc = "decrease a number by one" }) -- decrease a number under cursor
map("n", "<A-=>", "<C-a>", { desc = "increase a number by one" }) -- increase a number under cursor
map("n", "<M-C-=>", function()
  -- vim.api.nvim_command("let v:count = " .. _G.increment_value)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(tostring(_G.increment_value) .. "<C-a>", true, false, true),
    "n",
    true
  )
  _G.increment_value = _G.increment_value + 1 + math.floor(_G.increment_value / 10)
  _G.decrement_value = 1
end)
map("n", "<M-C-->", function()
  -- vim.api.nvim_command("let v:count = " .. _G.increment_value)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(tostring(_G.decrement_value) .. "<C-x>", true, false, true),
    "n",
    true
  )
  _G.decrement_value = _G.decrement_value + 1 + math.floor(_G.decrement_value / 10)
  _G.increment_value = 1
end)

map("n", "<F8>", ":e ++enc=utf-8<CR>", { desc = "reopen current buffer using utf-8 encoding" })
map("n", "<F12>", ":e ++enc=cp1251<CR>", { desc = "reopen current buffer using cp1251 encoding" })

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo toggle Undotree" })

-- disable hjkl in order to learn leap motions (arrows still can be used)
-- map({ "n", "v" }, "h", "<nop>")
-- map({ "n", "v" }, "j", "<nop>")
-- map({ "n", "v" }, "k", "<nop>")
-- map({ "n", "v" }, "l", "<nop>")
--

-- map("n", "<leader>g", ":!kitty --start-as=maximized lazygit &<CR><CR>")

map("n", "<leader>g", ":term<CR>ilazygit && exit<CR>")
-- map("n", "<leader>g", function()
-- require("nvchad.term").runner {
--   cmd = "lazygit && exit\n",
--   id = "lazygit_term",
--   pos = "float",
--   float_opts = {
--     row = 0.01,
--     col = 0.01,
--     width = 0.98,
--     height = 0.98,
--   },
-- }
-- end)

--
-- whichkey
--

local mma_mappings_group = vim.api.nvim_create_augroup("WolframMathematicaMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mma",
  group = mma_mappings_group,
  callback = function()
    local startWL = function()
      io.popen "kitty -o allow_remote_control=yes --listen-on unix:/tmp/kitty_wolfram WolframKernel&"
      -- io.popen "kitten @ --to unix:/tmp/mykitty send-text 'WolframKernel\r' &"
    end

    local function get_visual_selection()
      local s_start = vim.fn.getpos "'<"
      local s_end = vim.fn.getpos "'>"
      local n_lines = math.abs(s_end[2] - s_start[2]) + 1
      local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
      lines[1] = string.sub(lines[1], s_start[3], -1)
      if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
      else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
      end
      return table.concat(lines, "\n")
    end

    runWL = function()
      local text = get_visual_selection()
      text = text:gsub("\\", "\\\\\\\\")
      text = text:gsub('"', '\\"')
      text = text:gsub("`", "\\`")
      text = text:gsub("\n", "\\\\\n")
      -- text = text:gsub("$", "\\\\$")
      -- text = text:gsub("\'", "\\\'")
      io.popen('kitten @ --to unix:/tmp/kitty_wolfram  send-text "' .. text .. '\r" &')
    end

    map("n", "<leader>ll", startWL, { buffer = true })
    map("n", "<leader>r", "mrvip:lua runWL()<CR>`r", { buffer = true })
    map("v", "<leader>r", runWL, { buffer = true })

    -- nm("<leader>rr", "<Plug>SnipRun" )
    -- nm("<leader>r", "<Plug>SnipRunOperator")
    -- vm("<leader>r",  "<Plug>SnipRun")
    -- nm("<leader>R", "<Plug>SnipReset")
    -- nm("<leader>RL", "<Plug>SnipLive")

    map("i", "\\a", "\\[Alpha]", { buffer = true })
    map("i", "\\b", "\\[Beta]", { buffer = true })
    map("i", "\\g", "\\[Gamma]", { buffer = true })
    map("i", "\\G", "\\[CapitalGamma]", { buffer = true })
    map("i", "\\d", "\\[Delta]", { buffer = true })
    map("i", "\\D", "\\[CapitalDelta]", { buffer = true })
    map("i", "\\e", "\\[CurlyEpsion]", { buffer = true })
    map("i", "\\z", "\\[Zeta]", { buffer = true })
    map("i", "`h", "\\[Eta]", { buffer = true })
    map("i", "`o", "\\[Theta]", { buffer = true })
    map("i", "``o", "\\[CapitalTheta]", { buffer = true })
    map("i", "\\q", "\\[Theta]", { buffer = true })
    map("i", "\\Q", "\\[CapitalTheta]", { buffer = true })
    -- im('<A-i>', "\iota]])
    -- im('<A-k>', "\kappa]])
    map("i", "`l", "\\[Lambda]", { buffer = true })
    map("i", "`L", "\\[CapitalLambda]", { buffer = true })
    map("i", "`m", "\\[Mu]", { buffer = true })
    map("i", "`n", "\\[Nu]", { buffer = true })
    map("i", "\\x", "\\[xi]", { buffer = true })
    map("i", "\\X", "\\[Xi]", { buffer = true })
    -- o O
    map("i", "`p", "\\[Pi]", { buffer = true })
    map("i", "``p", "\\[CapitalPi]", { buffer = true })
    map("i", "\\r", "\\[Rho]", { buffer = true })
    map("i", "\\s", "\\[Sigma]", { buffer = true })
    map("i", "\\S", "\\[CapitalSigma]", { buffer = true })
    map("i", "\\t", "\\[Tau]", { buffer = true })
    map("i", "`u", "\\[Upsilon]", { buffer = true })
    map("i", "``u", "\\[CapitalUpsilon]", { buffer = true })
    map("i", "\\f", "\\[CurlyPhi]", { buffer = true })
    map("i", "\\F", "\\[CapitalPhi]", { buffer = true })
    map("i", "\\c", "\\[Chi]", { buffer = true })
    map("i", "\\C", "\\[CapitalChi]", { buffer = true })
    map("i", "`j", "\\[Psi]", { buffer = true })
    map("i", "``j", "\\[CapitalPsi]", { buffer = true })
    map("i", "`y", "\\[Psi]", { buffer = true })
    map("i", "``y", "\\[CapitalPsi]", { buffer = true })
    map("i", "\\w", "\\[omega]", { buffer = true })
    map("i", "\\W", "\\[Omega]", { buffer = true })
  end,
})

local cpp_mappings_group = vim.api.nvim_create_augroup("CppMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "hpp", "h" }, -- Filetypes to match
  group = cpp_mappings_group, -- Assign to the group
  callback = function()
    -- map("n", "<leader>mr", "<cmd>make run<CR>", { buffer = true, desc = "make run" })
    -- map(
    --   "n",
    --   "<leader>md",
    --   "<cmd>make debug<CR><cmd> DapContinue <CR>main_debug<CR>",
    --   { buffer = true, desc = "make debug" }
    -- )
    -- map("n", "<leader>mc", "<cmd>make clean<CR>", { buffer = true, desc = "make clean" })
    -- map("n", "<leader>r", ":w<CR>:make -C %:p:h run FILE=%:p<CR>")
    -- map("n", "<leader>R", ":w<CR>:!kitty --hold -d %:p:h make run %:t:r & <CR><CR>")

    -- map("n", "<leader>rr", ":w | !kitty --hold --title 'c++' --start-as=fullscreen cr \"%\" &<CR><CR>")

    -- local run_kitty = " kitty --hold -o allow_remote_control=yes --listen-on unix:/tmp/kitty_cpp "
    -- local send_to_kitty = " kitten @ --to unix:/tmp/kitty_cpp send-text "
    -- local run_cr = 'cr "%:p"'
    -- map("n", "<leader>rr", ":w | !(" .. send_to_kitty .. run_cr .. "\\\\r) || (" .. run_kitty .. run_cr .. ") &<CR><CR>", {desc = "run c++ file in release mode"})
    -- map("n", "<leader>rd", ":w | !(" .. send_to_kitty .. run_cr .. " -d \\\\r) || (" .. run_kitty .. run_cr .. " -d ) &<CR><CR>", {desc = "run c++ file in debug mode"})
    --

    map("n", "<leader>rr", ":vsplit term://cr '%:p'<CR>A", { desc = "run current c++ file in release mode" })
    map("n", "<leader>rd", ":vsplit term://cr '%:p' -d<CR>A", { desc = "run current c++ file in release mode" })

    -- map("n", "<leader>rr", function()
    --   require("nvchad.term").runner {
    --     cmd = "cr '%:p'",
    --     pos ="vsp",
    --     size=0.5,
    --     id = "vtoggleTerm",
    --     clear_cmd = "",
    --   }
    -- end)
  end,
})

-- map("n", "<leader>b", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
-- map("n", "<C-.>", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

-- map("n", "<leader>dq", function() require("dapui").close() end, { desc = "debugger ui close" })
-- map("n", "<leader>ds", ":DapContinue<CR>1<CR>")
-- map("n", "<leader>dl", function() require("dap").run_last() end)
-- map("n", )
--
local dap = require("dap")
local dapui = require("dapui")
map("n", "<C-'>", function() dap.run_to_cursor() end)
map("n", "<C-Up>", function() dap.step_back() end)
map("n", "<C-Down>", function() dap.step_over() end)
map("n", "<C-Left>", function() dap.step_out() end)
map("n", "<C-Right>", function() dap.step_into() end)
map("n", "<C-PageUp>", function() dap.reverse_continue() end)
map("n", "<C-PageDown>", function() dap.continue() end)
map("n", "<C-Esc>", function() dap.terminate(); dapui.close() end)
map("n", "<C-m>", function() dap.toggle_breakpoint() end)


--
-- vim.keymap.set("n", "<Leader>b", function()
--   require("dap").toggle_breakpoint()
-- end)
-- vim.keymap.set("n", "<Leader>B", function()
--   require("dap").set_breakpoint()
-- end)
-- vim.keymap.set("n", "<Leader>lp", function()
--   require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
-- end)
-- vim.keymap.set("n", "<Leader>dr", function()
--   require("dap").repl.open()
-- end)
-- vim.keymap.set("n", "<Leader>dl", function()
--   require("dap").run_last()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
--   require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
--   require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<Leader>df", function()
--   local widgets = require "dap.ui.widgets"
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
--   local widgets = require "dap.ui.widgets"
--   widgets.centered_float(widgets.scopes)
-- end)
