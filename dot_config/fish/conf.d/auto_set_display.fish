# set -gx DISPLAY :0

#set XAUTH_ID $(xauth list "$DISPLAY" | tail -n 1 | awk '{print $NF}')

# xauth add "$DISPLAY" . "$XAUTH_ID"
