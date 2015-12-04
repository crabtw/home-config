if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset fp+ ~/.fonts/bitmap

export LANG="zh_TW.UTF-8"
export LC_ALL="zh_TW.UTF-8"

export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

# common
xrdb -merge -I$HOME ~/.Xresources
xmodmap ~/.xmodmaprc
ibus-daemon -dxr

# xmonad
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 10 --transparent true --tint 0x000000 --height 18 &
xsetroot -cursor_name left_ptr -fg gray -bg black -solid black
exec xmonad

# KDE
#exec startkde
