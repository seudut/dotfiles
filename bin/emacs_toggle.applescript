
## this scirpt works together with Quicksilver
## copy/link this file to ~/Library/Application Support/Quicksilver/Action
## and set a toggle event on Quicksilver preference
#
## http://brettterpstra.com/2011/01/22/quick-tip-applescript-application-toggle/ 
#
#
#Version 1.0 toggle emacs front

set appName to "Emacs"
set startIt to false
tell application "System Events"
    if not (exists process appName) then
        set startIt to true
    else if frontmost of process appName then
        set visible of process appName to false
    else
        set frontmost of process appName to true
    end if
end tell
if startIt then
    tell application appName to activate
end if

## version 2.0 - using emacs daemon and client
##set appName to "Emacs"
##set startIt to false
##tell application "System Events"
##    try
##        -- we look for <= 2 because Emacs --daemon seems to always have an entry in visibile-frame-list even if there isn't
##        set frameVisible to do shell script "/usr/local/bin/emacsclient -e '(<= 2 (length (visible-frame-list)))'"
##        if frameVisible is not "t" then
##            -- there is a not a visible frame, launch one
##            do shell script "/usr/local/bin/emacsclient -c -n"
##            set startIt to true
##        else if frontmost of process "Emacs" then
##            set visible of process "Emacs" to false
##        else
##            set frontmost of process "Emacs" to true
##        end if
##    on error
##        -- daemon is not running, start the daemon and open a frame		
##        do shell script "/usr/local/bin/emacs --daemon"
##        do shell script "/usr/local/bin/emacsclient -c -n"
##        set startIt to true
##    end try
##end tell
##
##-- bring the visible frame to the front
##if startIt then
##    tell application "Emacs" to activate
##end if
