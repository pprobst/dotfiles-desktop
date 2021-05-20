-------------------
-- xmonad config --
-------------------

-------------
-- IMPORTS --
-------------
-- Main
import System.IO
import System.Exit
import XMonad

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops -- required for ueberzug to work
import XMonad.Hooks.WorkspaceHistory

-- Layouts
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns (ThreeCol (ThreeColMid))
import XMonad.Layout.MultiColumns (multiCol)
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Circle

-- Layout modifiers
import XMonad.Layout.NoBorders
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Spacing

-- Utils
import XMonad.Util.Run (spawnPipe, spawnPipeWithUtf8Encoding, spawnPipeWithNoEncoding)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

-- Actions
import XMonad.Actions.Promote
import XMonad.Actions.WithAll (sinkAll)
import XMonad.Actions.MouseResize
import XMonad.Actions.CycleWS (prevWS, nextWS)
import XMonad.Actions.TreeSelect

--import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Tree

------------
-- CONFIG --
------------

-- Colors and borders
--
myNormalBorderColor  = "#171717"
myFocusedBorderColor = "#3B6585"

-- Window title color
xmobarTitleColor = "#6A9B88"

-- Current workspace color
xmobarCurrentWorkspaceColor = "#5083A9"

-- Window border width
myBorderWidth = 2

------------------------------------------------------------------------

-- Basics
--
-- Terminal
--myTerminal = "st"
myTerminal = "alacritty"

-- Lock screen
myScreensaver = "lock"

-- Screenshot
myScreenshot = "maimn"

-- Area screenshot
myAreaScreenshot = "maims"

-- File manager
myFileManager = "lfrun"

-- Program launcher
myLauncher = "dmenur"

-- xmobar location
myXmobarrc = "~/.xmonad/xmobar.hs"

-- Workspaces
--
myWorkspaces = [" 1", " 2", " 3", " 4", " 5", " 6"] ++ map show [7..9]

{- myWorkspaces :: Forest String
myWorkspaces = [ Node "Browser" [] -- a workspace for your browser
               , Node "Home"       -- for everyday activity's
                   [ Node "1" []   --  with 4 extra sub-workspaces, for even more activity's
                   , Node "2" []
                   , Node "3" []
                   , Node "4" []
                   ]
               , Node "Programming" -- for all your programming needs
                   [ Node "Haskell" []
                   , Node "Docs"    [] -- documentation
                   ]
               ]
-}

------------------------------------------------------------------------
-- Scratchpads
-- scratchpads :: [NamedScratchpad]
-- TODO


-- Window rules
--
myManageHook = composeAll
    [ resource  =? "desktop_window"                 --> doIgnore
    , className =? "Gcolor2"                        --> doCenterFloat
    , className =? "Steam"                          --> doFullFloat
    , className =? "Lutris"                         --> doCenterFloat
    , className =? "Godot"                          --> doFloat
    , className =? "Gimp"                           --> doFloat
    , className =? "Lxappearance"                   --> doCenterFloat
    , resource  =? "pqiv"                           --> doCenterFloat
    , className =? "Pavucontrol"                    --> doCenterFloat
    , className =? "File-roller"                    --> doCenterFloat
    , className =? "sun-awt-X11-XFramePeer"         --> doCenterFloat
    , className =? "tcc-ufsm-2020"                  --> doCenterFloat
    , className =? "rexpaint.exe"                   --> doCenterFloat
    , className =? "kanjitomo-reader-Launcher"      --> doFloat
    , className =? "mpv"                            --> doCenterFloat
    , className =? "Navigator"                      --> doFullFloat
    , className =? "oneshot"                        --> doFullFloat
    , className =? "steam_app_418460"               --> doFullFloat
    , className =? "hl2_linux"                      --> doFullFloat
    , className =? "deadcells"                      --> doFullFloat
    , className =? "DaggerfallUnity.x86_64"         --> doFullFloat
    , className =? "Starsector 0.9.1a-RC8"          --> doFullFloat
    , className =? "cogmind.exe"                    --> doFullFloat
    , className =? "spirits abyss.exe"              --> doFullFloat
    , className =? "dosbox.exe"                     --> doFullFloat
    , className =? "Wine"                           --> doFullFloat
    , className =? "gzdoom"                         --> doFullFloat
    , className =? "ia"                             --> doFullFloat
    , className =? "t-engine"                       --> doFullFloat
    , className =? "cataclysm-tiles"                --> doFullFloat
    , className =? "factorio"                       --> doFullFloat
    , className =? "SkullGirls.x86_64-pc-linux-gnu" --> doCenterFloat
    , className =? "Terraria.bin.x86_64"            --> doCenterFloat
    , className =? "riftwizard.exe"                 --> doCenterFloat
    , className =? "katana zero.exe"                --> doFullFloat
    , className =? "CoQ.x86_64"                     --> doFullFloat
    , className =? "adl"                            --> doCenterFloat
    , title     =? "The Carribean Sail"             --> doCenterFloat
    , title     =? "Underrail"                      --> doFullFloat
    , title     =? "Disco Elysium"                  --> doFullFloat
    , title     =? "Shadow Tactics Blades of the Shogun" --> doFullFloat
    , title     =? "Darkwood"                       --> doFullFloat
    , title     =? "WazHack"                        --> doFullFloat
    , title     =? "Catacomb Kids"                  --> doFullFloat
    , title     =? "TheSilverCase"                  --> doCenterFloat
    , title     =? "(Fiji Is Just) ImageJ"          --> doCenterFloat
    , isDialog                                      --> doCenterFloat
    , isFullscreen                                  --> (doF W.focusDown <+> doFullFloat)]

------------------------------------------------------------------------

-- Layouts
--
-- Gaps between windows: (mySpacing (layout config)) |||...
-- mySpacing = spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True

myLayout = avoidStruts (
    ResizableTall 1 (3/100) (1/2) [] |||
    ThreeColMid 1 (3/100) (1/2) |||
    Grid |||
    multiCol [1] 1 0.01 (-0.5) |||
    spiral (6/7) |||
    Circle |||
    simplestFloat |||
    Full)

-----------------------------------------------------------------------

-- Key bindings
--
myModMask = mod4Mask -- (((windows))) key

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

  -- Start a terminal
  [ ((modMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Fortune cookie
  , ((modMask, xK_z), 
     spawn "getFortune")

  -- Emacs
  , ((modMask, xK_e), 
     spawn "emacs")

  -- Emoji!
  , ((modMask, xK_r), 
     spawn "dmenuunicode")

  -- Calendar (current month)
  , ((modMask, xK_c), 
     spawn "getMonth")

  -- Current weather
  , ((modMask, xK_w), 
     spawn "getWttr")

  -- Lock screen
  , ((modMask, xK_i),
     spawn myScreensaver)

  -- Spawn launcher
  , ((modMask, xK_d),
     spawn myLauncher)

  -- Lock screen
  , ((modMask, xK_p),
     spawn "pass_menu")

  -- Full screen screenshot
  , ((0, xK_Print),
     spawn myScreenshot)

  -- Area screenshot
  , ((modMask, xK_Print), 
     spawn myAreaScreenshot)

  -- OCR screenshot
  , ((modMask .|. shiftMask, xK_Print), 
     spawn "ocr-clipboard")

  -- Spawn file manager
  , ((modMask, xK_f), 
     --spawn (myTerminal ++ " -e " ++ myFileManager))
     spawn ("st" ++ " -e " ++ myFileManager))

  -- Mute vol
  , ((modMask .|. controlMask, xK_m),
     spawn "amixer -q set Master toggle")

  -- Decrease vol
  , ((modMask, xK_minus),
     spawn "amixer -q set Master 5%-")

  -- Increase vol
  , ((modMask, xK_equal),
     spawn "amixer -q set Master 5%+")

  -- Close focused window
  , ((modMask, xK_q),
     kill)

  -- Cycle through layout algorithms
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window
  , ((modMask, xK_k),
     windows W.focusUp)

  -- Move focus to the master window
  , ((modMask, xK_m),
     windows W.focusMaster)

  -- Swap the focused window and the master window
  , ((modMask .|. shiftMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown)

  -- Swap the focused window with the previous window
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp)

  , ((modMask, xK_BackSpace), 
     promote)

  -- Shrink the master area
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Arrange
  , ((modMask .|. shiftMask .|. controlMask, xK_Up), 
     sendMessage Arrange) 

  -- De-arrange
  , ((modMask .|. shiftMask .|. controlMask, xK_Down), 
     sendMessage DeArrange) 

  -- Move right
  , ((modMask, xK_Right), 
     sendMessage (MoveRight 20))

  -- Move left
  , ((modMask, xK_Left), 
     sendMessage (MoveLeft 20))

  -- Move up
  , ((modMask, xK_Up), 
     sendMessage (MoveUp 20))

  -- Move down
  , ((modMask, xK_Down), 
     sendMessage (MoveDown 20))

  -- Increase right focused window 
  , ((modMask .|. shiftMask, xK_Right), 
     sendMessage (IncreaseRight 20))

  -- Increase left focused window 
  , ((modMask .|. shiftMask, xK_Left), 
     sendMessage (IncreaseLeft 20))

  -- Increase up focused window 
  , ((modMask .|. shiftMask, xK_Up), 
     sendMessage (IncreaseUp 20))

  -- Increase down focused window 
  , ((modMask .|. shiftMask, xK_Down), 
     sendMessage (IncreaseDown 20))

  -- Decrease right focused window 
  , ((modMask .|. controlMask, xK_Right), 
     sendMessage (DecreaseRight 20))

  -- Decrease left focused window 
  , ((modMask .|. controlMask, xK_Left), 
     sendMessage (DecreaseLeft 20))

  -- Decrease up focused window 
  , ((modMask .|. controlMask, xK_Up), 
     sendMessage (DecreaseUp 20))

  -- Decrease down focused window 
  , ((modMask .|. controlMask, xK_Down), 
     sendMessage (DecreaseDown 20))

  -- For ResizableTall:
  -- Shrink vertically focused window (ç)
  , ((modMask, xK_ccedilla),
     sendMessage MirrorShrink)

  -- Expand vertically focused window (~)
  , ((modMask, 0xfe53),
     sendMessage MirrorExpand)

  -- Push window back into tiling
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Push ALL windows back into tiling
  , ((modMask .|. shiftMask, xK_t),
     sinkAll)

  -- Increment the number of windows in the master area
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Restart xmonad
  , ((modMask .|. shiftMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- Move to next WS
  [((modMask, xK_Page_Up),
     nextWS)

  -- Move to previous WS
  , ((modMask, xK_Page_Down),
     prevWS)]

------------------------------------------------------------------------

-- Mouse bindings
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

{- myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))
  ]
-}
------------------------------------------------------------------------

-- Startup hook
--
myStartupHook = do
            spawnOnce "feh --bg-fill /home/probst/Images/Wallpapers/current-desktop.png"
            --spawnOnce "feh --bg-tile /home/probst/Images/Wallpapers/current-desktop.png"
            setWMName "LG3D"  -- to make java programs work (lol)

------------------------------------------------------------------------

-- Run xmonad
--
main = do
  xmproc <- spawnPipeWithNoEncoding ("xmobar " ++ myXmobarrc)
  xmonad $ ewmh defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 70
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = " : "
      }
      , manageHook = manageDocks <+> myManageHook
      , handleEventHook = docksEventHook
  }

------------------------------------------------------------------------

-- Struct w/ config settings
--
defaults = def {
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    -- workspaces         = toWorkspaces myWorkspaces,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    --mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = mouseResize $ windowArrange $ smartBorders $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
