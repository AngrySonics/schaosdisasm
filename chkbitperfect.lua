#!/usr/bin/env lua

local clownmd5 = require "lua.clownmd5"

-- Prevent make.lua's calls to os.exit from terminating the program.
local os_exit = os.exit
os.exit = coroutine.yield

-- Restore os.exit back to normal.
os.exit = os_exit

local f = io.open("schaos.sms", "r")
if f == nil then
	print "I can't seem to find the built ROM. Perhaps you should try running build.bat?"
	return false
end

if not abort then
	-- Hash the ROM.
	local hash = clownmd5.HashFile("schaos.sms")

	-- Verify the hash against known builds.
	print "-------------------------------------------------------------"

	if hash == "\x1D\x66\x11\x34\xB1\x4E\xED\xF6\xB4\xAE\x1C\x90\x75\x81\xFD\x96" then
		print "Sonic Chaos ROM is bit-perfect."
	else
		print "Sonic Chaos ROM is NOT bit-perfect!"
	end
end
