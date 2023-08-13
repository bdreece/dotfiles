--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/usr/share/backgrounds/lofi-late-night-coffee-shop-2-1366×768.png"

-- Special
background="#0d1215"
foreground="#9bc1dd"
cursor="#9bc1dd"

-- Colors
color0="#0d1215"
color1="#575966"
color2="#A45A4E"
color3="#708466"
color4="#B0936C"
color5="#DBA069"
color6="#2E5399"
color7="#9bc1dd"
color8="#6c879a"
color9="#575966"
color10="#A45A4E"
color11="#708466"
color12="#B0936C"
color13="#DBA069"
color14="#2E5399"
color15="#9bc1dd"