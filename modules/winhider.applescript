#!/usr/bin/env osascript

if application "iTerm" is running then
	tell application "iTerm"
		tell current window to set visible to false
	end tell
end if

if application "Terminal" is running then
	tell application "Terminal" to set visible of every window to false
end if