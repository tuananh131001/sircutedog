local M = {}

local function remind_to_stand_up(image_path)
	local cmd = "kitty +kitten icat " .. image_path
	os.execute(cmd)
	vim.notify("Sir is a cute dog", vim.log.levels.INFO, {
		title = "SIR 👑",
    timeout = 5000
	})
end

function M.start_reminder(interval)
	interval = interval or 3000

	local timer = vim.loop.new_timer()

	-- Use a lambda function to pass the argument to remind_to_stand_up
	timer:start(
		0,
		interval,
		vim.schedule_wrap(function()
			remind_to_stand_up("./image.png")
		end)
	)

	_G.standup_reminder_timer = timer
end

return M
