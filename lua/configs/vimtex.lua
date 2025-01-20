vim.g.tex_flavor='latex'
vim.g.vimtex_view_method='zathura'
-- vim.g.tex_comment_nospell=1
vim.g.vimtex_syntax_nospell_comments=1
vim.g.vimtex_quickfix_mode=1



vim.g.vimtex_mappings_disable = {
             -- ['n']= {'tse', 'tsd','ts$'},
             -- ['x']= {'tsd'},
             ['i']= {']]','#B','#-','#c','#f','#b','#/'},
            }

vim.g.vimtex_syntax_conceal = {
           ['accents'] = 1,
           ['ligatures'] = 1,
           ['cites'] = 1,
           ['fancy'] = 1,
           ['spacing'] = 1,
           ['greek'] = 1,
           ['math_bounds'] = 0,
           ['math_delimiters'] = 1,
           ['math_fracs'] = 1,
           ['math_super_sub'] = 1,
           ['math_symbols'] = 1,
           ['sections'] = 1,
           ['styles'] = 1,
          }
vim.opt.conceallevel=2
vim.cmd("highlight clear Conceal")
-- vim.g.vimtex_syntax_conceal_disable = 1

vim.g.vimtex_delim_toggle_mod_list = {
    {'\\left', '\\right'},
    {'\\bigl', '\\bigr'},
    {'\\Bigl', '\\Bigr'},
    {'\\biggl', '\\biggr'},
    {'\\Biggl', '\\Biggr'},
}


vim.g.vimtex_env_toggle_math_map = {
           ['$'] = '\\[',
           ['$$'] = '\\[',
           ['\\('] = '$',
           ['\\['] = 'equation',
           ['equation'] = 'multline',
           ['multline'] = 'align',
           -- ['\\['] = {'a', 'b'},
}

vim.g.vimtex_toggle_fractions = {
           ['INLINE'] = 'frac',
           ['frac'] = 'dfrac',
           ['dfrac'] = 'INLINE',
          }

vim.g.vimtex_mappings_disable = {
	-- ['n'] = {'tse', 'tsd','ts$'},
	-- ['x'] = {'tsd'},
	['i'] = {']]'},
}

vim.g.vimtex_quickfix_ignore_filters = {
    'Package siunitx Warning: Detected the "physics" package:',
    'Package hyperref Warning: Token not allowed in a PDF string',
    "Package microtype Warning: Unable to apply patch `eqnum'",
	-- "qedhere command may not work correctly here",
	"Package unicode-math Warning:"
}

local VimtexGroup = vim.api.nvim_create_augroup('VimtexGroup', {clear = true})

vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventQuit",
    command = "VimtexClean",
    group = VimtexGroup
})


-- in_mathzone = vim.fn["vimtex#syntax#in_mathzone"]
--
-- set_kb_layout_math = function()
-- 	if in_mathzone()==1 then set_kb_layout(0) else set_kb_layout(default_kb_layout) end
-- end
--
-- vim.api.nvim_create_autocmd({"ModeChanged"}, {
--     pattern = "*.tex,n:i",
--     callback = set_kb_layout_math,
--     group = VimtexGroup,
-- })
--
-- vim.api.nvim_create_autocmd({"InsertLeave"}, {
--     pattern = "*.tex",
--     callback = set_kb_layout_en,
--     group = VimtexGroup,
-- })
