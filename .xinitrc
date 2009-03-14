xset fp+ ~/.fonts/bitmap

export LANG="zh_TW.UTF-8"
export LC_ALL="zh_TW.UTF-8"

export XMODIFIERS="@im=SCIM"
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
scim -d

# xmonad
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 10 --transparent true --tint 0x000000 --height 18 &
xsetroot -cursor_name left_ptr -fg gray -bg black -solid black
exec xmonad

# KDE
#exec startkde
