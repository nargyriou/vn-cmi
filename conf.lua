function love.conf(t)
	local fullscreen = false


	io.stdout:setvbuf("no")
	if fullscreen then
		t.window.width = 1920
		t.window.height = 1080
		t.window.fullscreen= true
	else
		t.window.width = 1280
		t.window.height = 720
	end
	t.window.vsync = false
--	t.window.width = 1920
--	t.window.height = 1080
--	t.window.fullscreen = true
	t.window.title = "Animation"
end

