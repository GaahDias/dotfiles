local apps = {}

-- Default apps:
local defaultApps = {terminal = "alacritty",
        player = "vlc",
        editor = "leafpad",
        browser = "firefox",
        music = "spotify",
        markdown = "marktext",
        files = "dolphin",}

function apps.getApps()
	return defaultApps
end

return apps