-- Some utility functions I'm using for my widgets
local utils = {}

function utils.random_files(path)
    local i, t, popen = 0, {}, io.popen
    for filename in popen("ls " .. path .. " | shuf"):lines() do
        print(filename)
        i = i + 1
        t[i] = filename
    end
    return t
end

function utils.os_output(cmd)
	local reader = io.popen(cmd, 'r')
	if reader ~= nil then
		local output = reader:read()
		reader:close()

		return output
	end
end

function utils.split_str(input_str, sep)
	local t = {}
	for s in string.gmatch(input_str, "([^"..sep.."]+)") do
		table.insert(t, s)
	end
	return t
end

return utils
