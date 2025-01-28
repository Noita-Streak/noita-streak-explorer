---func
---@param content string
---@return string
local function rewrite_code(content)
  -- ガラスキャノンダメージの修正
  content = content:gsub("damage = damage %* 3%.0", "damage = damage * 0.2 * 3.0")
  -- ガラスキャノンのタイプ別ダメージの修正
  content = content:gsub("v = v %* 3%.0", "v = v * 0.2 * 3.0")
  -- config_explosionのダメージ修正
  content = content:gsub("v = v %* 4%.0", "if (v ~= nil) then v = v * 0.2 * 4.0")
  -- 存在しない項目読み込みによるnilエラー回避
  content = content:gsub(
    'ComponentObjectSetValue%( comp, %"config_explosion%", b, tostring%(v%) %)',
    'ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) ) end'
  )
  return content
end

local function rewrite()
  local content = ModTextFileGetContent("data/scripts/perks/glass_cannon_enemy.lua")

  local md5 = dofile_once("mods/noita-streak-explorer/libs/md5/md5.lua")
  local hash = dofile_once("mods/noita-streak-explorer/files/rewrite/hash.lua")

  local result = md5.sumhexa(content)
  local valid = result == hash.glass_cannon_enemy

  if not valid then
    error("Rewrote noita file glass_cannon_enemy.lua")
    return
  end

  content = rewrite_code(content)
  ModTextFileSetContent("data/scripts/perks/glass_cannon_enemy.lua", content)
end

return {
  rewrite = rewrite,
  rewrite_code = rewrite_code,
}
