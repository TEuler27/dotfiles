-- Record directories visited inside Yazi in zoxide, so `Z` (and `z` in the shell) learn from them
require("zoxide"):setup {
	update_db = true,
}
