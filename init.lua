dofile_once("mods/noita-streak-explorer/files/scripts/rewrite/entry.lua").rewrite()

function OnModPreInit()
  print("Mod - OnModPreInit()")
end

function OnModInit()
  print("Mod - OnModInit()")
end

function OnModPostInit()
  print("Mod - OnModPostInit()")
end

function OnPlayerSpawned(_player_entity) end

function OnWorldInitialized()
  -- GamePrint("OnWorldInitialized() " .. tostring(GameGetFrameNum()))
end

function OnWorldPreUpdate()
  -- GamePrint("Pre-update hook " .. tostring(GameGetFrameNum()))
end

function OnWorldPostUpdate()
  -- GamePrint("Post-update hook " .. tostring(GameGetFrameNum()))
end

function OnMagicNumbersAndWorldSeedInitialized() end
