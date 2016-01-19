
## this scirpt works together with Quicksilver
## copy/link this file to ~/Library/Application Support/Quicksilver/Action
## and set a toggle event on Quicksilver preference
#tell application "System Events"
#    tell application process "Emacs"
#        if visible then
#            set visible to false
#        else
#            set visible to true
#            tell application "Emacs" to activate
#        end if
#    end tell
#end tell
#
## http://brettterpstra.com/2011/01/22/quick-tip-applescript-application-toggle/ 
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

