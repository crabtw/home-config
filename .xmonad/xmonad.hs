import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts

import XMonad.Util.Run (spawnPipe)

import qualified Data.Map as M
import System.IO.UTF8 (hPutStrLn)

myPP bar = xmobarPP {
            ppOutput = hPutStrLn bar
           }

myLayout = toggleLayouts (noBorders Full) defaultLayout
    where defaultLayout = avoidStruts $
                          smartBorders $
                          layoutHook defaultConfig

myKeys x = M.union (keys defaultConfig x) (M.fromList (newKeys x))
    where newKeys x = [((modMask x, xK_f), sendMessage ToggleLayout)]

myManageHook = manageDocks <+> manageHook defaultConfig

main = do xmobar <- spawnPipe "xmobar"
          xmonad $ defaultConfig {
            layoutHook = myLayout,
            logHook = dynamicLogWithPP $ myPP xmobar,
            keys = myKeys,
            modMask = mod4Mask,
            manageHook = myManageHook,
            startupHook = setWMName "LG3D",
            terminal = "mlterm"
          }
