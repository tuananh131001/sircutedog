local M = {}

local function remind_to_stand_up()
	vim.notify("Sir is a cute dog", vim.log.levels.INFO, {
		title = "SIR 👑",
	})
end

function M.start_reminder(interval)
	interval = interval or 3000

	local timer = vim.loop.new_timer()

	timer:start(0, interval * 1000, vim.schedule_wrap(remind_to_stand_up))
	_G.standup_reminder_timer = timer
end

return M
