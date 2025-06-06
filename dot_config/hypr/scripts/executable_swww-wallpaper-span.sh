#!/bin/bash
# wallpapers=$HOME/wallpaper
# random=$(ls $wallpapers | shuf | head -1)
# random=$wallpapers/$random
random=~/wallpaper/sunset-lookout.jpg

# split image
convert -crop 50%x100% $random /tmp/output.png

swww img -o "DP-2" --transition-type random /tmp/output-0.png
swww img -o "DP-1" --transition-type random /tmp/output-1.png
