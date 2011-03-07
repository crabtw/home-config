import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts

import XMonad.Util.Run (spawnPipe)

import qualified Data.Map as M
import System.IO

myPP bar = xmobarPP {
            ppOutput = hPutStrLn bar
           }

myLayout = toggleLayouts (noBorders Full) defaultLayout
    where defaultLayout = avoidStruts $ smartBorders layout
          layout = Mirror tiled ||| Full ||| tiled
            where tiled = Tall 1 (3/100) (1/2)

myKeys x = M.union (keys defaultConfig x) (M.fromList (newKeys x))
    where newKeys x = [((modMask x, xK_f), sendMessage ToggleLayout)]

myManageHook = manageDocks

main = do xmobar <- spawnPipe "xmobar"
          xmonad $ defaultConfig {
            layoutHook = myLayout,
            logHook = dynamicLogWithPP $ myPP xmobar,
            keys = myKeys,
            modMask = mod4Mask,
            manageHook = myManageHook,
            terminal = "urxvt"
          }
