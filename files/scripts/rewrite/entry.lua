local CONSTS = dofile_once("mods/noita-streak-explorer/files/scripts/const.lua")
local glass_cannon_enemy = dofile_once("mods/noita-streak-explorer/files/scripts/rewrite/perks/glass_cannon_enemy.lua")
local holiday_effects = dofile_once("mods/noita-streak-explorer/files/scripts/rewrite/holiday_effects.lua")

local function rewrite()
  -- NOTE: ガラスキャノンの修正
  local should_glass_cannon_fix = ModSettingGet(CONSTS.MOD_SETTINGS.FIX_GLASS_CANNON_ENEMY)
  if should_glass_cannon_fix == nil then
    should_glass_cannon_fix = false
  end
  if should_glass_cannon_fix then
    glass_cannon_enemy.rewrite()
  end

  -- NOTE: ホリデーイベント無効化
  local disable_holiday_effects = ModSettingGet(CONSTS.MOD_SETTINGS.DISABLE_HOLIDAY_EFFECTS)
  if disable_holiday_effects == nil then
    disable_holiday_effects = false
  end
  if disable_holiday_effects then
    holiday_effects.rewrite()
  end
end

return {
  rewrite = rewrite,
}
