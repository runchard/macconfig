-- ~/.hammerspoon/init.lua
------------------------------------------------------------------------------
-- ref:
-- http://larryhynes.net/2015/02/switching-from-slate-to-hammerspoon.html

local baseModifier = {"ctrl", "cmd"}
hs.window.animationDuration = 0

require("hs.application")
require("hs.window")

local function print_window(win)
   print("x:", win.x, "y:", win.y, "width", win.w, "height", win.h)
end

local function almost(x, y)
   local x = math.abs(x) + 100
   local y = math.abs(y) + 100  -- for 0 as cornor cases
   if x < y * 1.1 and x > y * 0.9 then
      return true
   else
      return false
   end
end


local function almost_window(w1, w2)
   if almost(w1.x, w2.x) and almost(w1.y, w2.y) and almost(w1.h, w2.h) and almost(w1.w, w2.w) then
      return true
   else
      return false
   end
end


-- rotate window to left/right/gold-ratio of screen
hs.hotkey.bind(baseModifier, "g", function()
                  if hs.window.focusedWindow() then
                     local win = hs.window.focusedWindow()
                     local f = win:frame()
                     local screen = win:screen()
                     local max = screen:frame()
                     if almost(f.x, max.x) and almost(f.h, max.h) then
                        print("move right")
                        f.x = max.x + (max.w / 2)
                        f.y = max.y
                        f.w = max.w / 2
                        f.h = max.h
                     elseif almost(f.x, max.x + (max.w / 2)) then
                        print("move golden pos")
                        f.x = (max.x + max.w) / 5
                        f.y = (max.y + max.h) / 6
                        f.w = max.w * 0.7
                        f.h = max.h * 0.75
                     else
                        print("move left")
                        f.x = max.x
                        f.y = max.y
                        f.w = max.w / 2
                        f.h = max.h
                     end
                     win:setFrame(f)
                  else
                     hs.alert.show("No active window")
                  end
end)

-- Moves window to left-half/right-half/full screen
hs.hotkey.bind(baseModifier, "l", function()
                  if hs.window.focusedWindow() then

                     local win = hs.window.focusedWindow()
                     local f = win:frame()
                     local screen = win:screen()
                     local max = screen:frame()

                     if almost_window(f, max) then
                        print("to top")
                        f.x = max.x
                        f.y = max.y
                        f.w = max.w
                        f.h = max.h / 2
                     elseif almost(f.y, max.y) and almost(f.h, max.h / 2) then
                        print("to bottom")
                        f.x = max.x
                        f.y = max.y / 2 + max.h / 2
                        f.w = max.w
                        f.h = max.h / 2
                     else
                        print("to fullscreen")
                        f.x = max.x
                        f.y = max.y
                        f.w = max.w
                        f.h = max.h
                     end
                     win:setFrame(f)

                  else
                     hs.alert.show("No active window")
                  end
end)


-- Hyper i to show window hints
hs.hotkey.bind(baseModifier, "i", function()
                  hs.hints.windowHints()
end)

-- Hyper ' move to next screen
hs.hotkey.bind(baseModifier, "'", function()
                  print("move to next screen")
                  if hs.window.focusedWindow() then
                     local win = hs.window.focusedWindow()
                     local screen = win:screen()
                     win:moveToScreen(screen:next())
                  else
                     hs.alert.show("No active window")
                  end
end)
