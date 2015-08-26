tell application "System Events"
    tell application process "Emacs"
        if visible then
            set visible to false
        else
            set visible to true
            tell application "Emacs" to activate
        end if
    end tell
end tell
