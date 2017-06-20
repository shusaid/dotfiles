local counter = 0
local watcher
watcher = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, function(ev)
    local keycode = ev:getKeyCode()
    local labels = {
        [hs.eventtap.event.types.keyDown] = "down",
        [hs.eventtap.event.types.keyUp] = "up",
    }
    print(labels[ev:getType()], keycode, ev:getCharacters(), hs.keycodes.map[keycode])
    counter = counter + 1
    if counter == 5 then
        watcher:stop()
    end
    return false
end):start()

------------------------------------------------------------
-- Basic Layout
------------------------------------------------------------

local function kCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, key, true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, key, false):post()
   end
end

local function remapKey(modifiers, key, kCode)
   hs.hotkey.bind(modifiers, key, kCode, nil, kCode)
end

--[[
remapKey({}, 0, kCode(31))
remapKey({}, 11, kCode(33))
remapKey({}, 8, kCode(40))
remapKey({}, 43, kCode(35))
remapKey({}, 2, kCode(14))
remapKey({}, 14, kCode(37))
remapKey({}, 3, kCode(0))
remapKey({}, 5, kCode(3))
remapKey({}, 4, kCode(11))
remapKey({}, 34, kCode(4))
remapKey({}, 38, kCode(17))
remapKey({}, 40, kCode(15))
remapKey({}, 37, kCode(45))
remapKey({}, 45, kCode(2))
remapKey({}, 31, kCode(8))
remapKey({}, 35, kCode(16))
remapKey({}, 47, kCode(9))
remapKey({}, 12, kCode(7))
remapKey({}, 15, kCode(6))
remapKey({}, 1, kCode(34))
remapKey({}, 41, kCode(1))
remapKey({}, 44, kCode(43))
remapKey({}, 17, kCode(38))
remapKey({}, 32, kCode(5))
remapKey({}, 9, kCode(32))
remapKey({}, 7, kCode(47))
remapKey({}, 16, kCode(12))
remapKey({}, 6, kCode(41))
]]

-------------- set Polyfil
hs.eventtap.keyStroke = function(mods, num)
    if type(num) == "number" then
        -- "a" is filler -- it is replaced by the value in the setKeyCode method
        hs.eventtap.event.newKeyEvent(mods, "a", true):setKeyCode(math.tointeger(num)):post()
        hs.eventtap.event.newKeyEvent(mods, "a", false):setKeyCode(math.tointeger(num)):post()
    else
        hs.eventtap.event.newKeyEvent(mods, string.lower(num), true):post()
        hs.eventtap.event.newKeyEvent(mods, string.lower(num), false):post()
    end
end

function kanaToKey(toKey)
  kanaMode.triggered = true
  hs.eventtap.keyStroke({}, toKey)
end

function kanaBind(mod, fromKey, kanaToKey)
  kanaMode:bind(mod, fromKey, kanaToKey, nil, kanaToKey)
end

----------------------------------------
-- Kana Modifier
----------------------------------------

kanaMode = hs.hotkey.modal.new()

--------------- Remapper


---------
-- Arrows
---------

-- a to →
kanaMode:bind({}, 0, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 124)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 124)
end)

-- e to ↓
kanaMode:bind({}, 14, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 125)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 125)
end)

-- l to ↑
kanaMode:bind({}, 37, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 126)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 126)
end)

-- i to ←
kanaMode:bind({}, 34, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 123)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 123)
end)

-- l to ctrl + ↑ mission control
kanaMode:bind({'ctrl'}, 37, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 126)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 126)
end)

-- for shift
-- a to →
kanaMode:bind({'shift'}, 0, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 124)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 124)
end)

-- e to ↓
kanaMode:bind({'shift'}, 14, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 125)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 125)
end)

-- l to ↑
kanaMode:bind({'shift'}, 37, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 126)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 126)
end)

-- i to ←
kanaMode:bind({'shift'}, 34, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 123)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 123)
end)

---------
-- Scrolls
---------

-- n to pagedown
kanaMode:bind({}, 45, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 121)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 121)
end)

-- c to pageup
kanaMode:bind({}, 8, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 116)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 116)
end)

-- h to pagetop
kanaMode:bind({}, 4, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 115)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 115)
end)

-- r to pageend
kanaMode:bind({}, 15, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 119)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 119)
end)

-- n to ctrl + pageDown (for webkit)
kanaMode:bind({'ctrl'}, 45, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 121)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 121)
end)

-- c to ctrl + pageup (for webkit)
kanaMode:bind({'ctrl'}, 8, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 116)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'ctrl'}, 116)
end)

---------
-- keys
---------

-- space to backspace
kanaMode:bind({}, 49, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 51)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 51)
end)

-- u to $
kanaMode:bind({}, 32, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 21)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 21)
end)

-- k to %
kanaMode:bind({}, 40, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 23)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 23)
end)

-- . to :
kanaMode:bind({}, 47, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 39)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 39)
end)

-- t to forwardback
kanaMode:bind({}, 17, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 117)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 117)
end)

-- s to return
kanaMode:bind({}, 1, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 36)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 36)
end)

-- x to esc
kanaMode:bind({}, 7, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 53)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({}, 53)
end)

-- cmd + forwardback
kanaMode:bind({'cmd'}, 49, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'cmd'}, 51)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'cmd'}, 51)
end)

-- &
kanaMode:bind({}, 11, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 22)
  end, nil, function()
    kanaMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 22)
end)

---------------

kana = hs.hotkey.bind({}, 104,
  function()
    kanaMode:enter()
    kanaMode.triggered = false
  end,
  function()
    kanaMode:exit()
    if not kanaMode.triggered then
      kana:disable()
      hs.eventtap.keyStroke({}, 104)
      kana:enable()
    end
  end
)

----------------------------------------
-- Eisuu Modifier
----------------------------------------

eisuuMode = hs.hotkey.modal.new()


---------------

-- y to *
eisuuMode:bind({}, 16, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 67)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 67)
end)

-- @ to ?
eisuuMode:bind({}, 33, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 44)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 44)
end)

-- c to /
eisuuMode:bind({}, 8, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 44)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 44)
end)

-- r to {
eisuuMode:bind({}, 15, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 30)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 30)
end)

-- n to }
eisuuMode:bind({}, 45, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 42)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 42)
end)

-- r to [
eisuuMode:bind({'shift'}, 15, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 30)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 30)
end)

-- n to ]
eisuuMode:bind({'shift'}, 45, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 42)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 42)
end)

-- g to ~
eisuuMode:bind({}, 5, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 24)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 24)
end)

-- s to =
eisuuMode:bind({}, 1, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 27)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 27)
end)

-- m to \
eisuuMode:bind({}, 46, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'alt'}, 93)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'alt'}, 93)
end)

-- shift + m to |
eisuuMode:bind({'shift'}, 46, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 93)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 93)
end)

-- d to "
eisuuMode:bind({}, 2, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 19)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 19)
end)

-- b to '
eisuuMode:bind({}, 11, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 26)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 26)
end)

-- t to (
eisuuMode:bind({}, 17, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 28)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 28)
end)

-- h to )
eisuuMode:bind({}, 4, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 25)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 25)
end)

-- t to <
eisuuMode:bind({'shift'}, 17, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 43)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 43)
end)

-- h to >
eisuuMode:bind({'shift'}, 4, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 47)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 47)
end)

-- p to plus
eisuuMode:bind({}, 35, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 69)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 69)
end)

-- : to _
eisuuMode:bind({}, 39, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 94)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({}, 94)
end)

---------
-- Design Tool
---------
eisuuMode:bind({'cmd'}, 35, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'cmd'}, 69)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'cmd'}, 69)
end)

---------------

eisuu = hs.hotkey.bind({}, 102,
  function()
    eisuuMode:enter()
    eisuuMode.triggered = false
  end,
  function()
    eisuuMode:exit()
    if not eisuuMode.triggered then
      eisuu:disable()
      hs.eventtap.keyStroke({}, 102)
      eisuu:enable()
    end
  end
)

-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
