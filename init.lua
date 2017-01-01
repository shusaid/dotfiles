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

basicLayout = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp }, function(event)

end)

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
--[[
eisuuMode:bind({'shift'}, 16, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 44)
  end, nil, function()
    eisuuMode.triggered = true
    hs.eventtap.keyStroke({'shift'}, 44)
end)
]]

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
