PS1="# "

# Calls the script
function battery_charge {
    /bin/bat 2>/dev/null
} 

# Set the right side prompt to the output of the script
RPROMPT='$(battery_charge)'
setopt promptsubst
setopt promptpercent
ZLE_RPROMPT_INDENT=0

