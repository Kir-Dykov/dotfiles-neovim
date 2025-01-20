local leap = require("leap")


-- vim.keymap.set('n',        's', '<Plug>(leap)')
-- vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
-- vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
-- vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')

-- leap.add_default_mappings()
--
leap.opts.case_sensitive = false
leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`'} --
leap.opts.max_phase_one_targets = nil
leap.opts.highlight_unlabeled_phase_one_targets = false
leap.opts.max_highlighted_traversal_targets = 10
leap.opts.substitute_chars = {}
-- leap.opts.safe_labels = 'sfnut/SFNLHMUGTZ?'
leap.opts.safe_labels = ''
leap.opts.labels = 'sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?'
leap.opts.special_keys = {
  next_target = '<enter>',
  prev_target = '<s-enter>',
  next_group = '<space>',
  prev_group = '<tab>',
}

require('leap.user').set_repeat_keys('<enter>', '<backspace>')
local leap_f = function ()
	leap.leap {
		target_windows = { vim.api.nvim_get_current_win() }
	}
end

vim.keymap.set({'n','x','o','v'}, ";", leap_f)
vim.keymap.set({'n','x','o','v'}, "<C-;>",
	function()
		SET_KB_LAYOUT_RU()
		leap.opts.labels = 'фывапролджэячсмитьбю.йцукенгшщзхъФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,ЙЦУКЕНГШЩЗХЪ'
		leap_f()
		SET_KB_LAYOUT_EN()
		leap.opts.labels = 'sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?'
	end)
