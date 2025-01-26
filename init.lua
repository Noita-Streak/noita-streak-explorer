dofile_once("mods/noita-streak-explorer/files/rewrite/entry.lua").rewrite()
local dotenv = dofile_once("mods/noita-streak-explorer/libs/env.lua")

dotenv.load_dotenv("mods/noita-streak-explorer/.env")
local env = dotenv.get("ENV")

if env == "local" then
  dofile_once("mods/noita-streak-explorer/spec/test_entry.lua").exec()
end

local content = ModTextFileGetContent("data/translations/common.csv")
local noita_streak_explorer_content = ModTextFileGetContent("mods/noita-streak-explorer/files/translations/common.csv")
ModTextFileSetContent("data/translations/common.csv", content .. noita_streak_explorer_content)

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
