local content = ModTextFileGetContent("data/scripts/perks/glass_cannon_enemy.lua")

-- ガラスキャノンダメージの修正
content = content:gsub("damage = damage %* 3%.0", "damage = damage * 0.2 * 3.0")
-- ガラスキャノンのタイプ別ダメージの修正
content = content:gsub("v = v %* 3%.0", "v = v * 0.2 * 3.0")
-- config_explosionのダメージ修正
content = content:gsub("v = v %* 4%.0", "if (v ~= nil) then v = v * 0.2 * 4.0")
-- 存在しない項目読み込みによるnilエラー回避
content = content:gsub("ComponentObjectSetValue%( comp, %\"config_explosion%\", b, tostring%(v%) %)", "ComponentObjectSetValue( comp, \"config_explosion\", b, tostring(v) ) end")

ModTextFileSetContent("data/scripts/perks/glass_cannon_enemy.lua", content)
