local function replace(path, hash)
  local utils = dofile_once("mods/noita-streak-explorer/files/scripts/utils.lua")
  dofile_once(path).rewrite(utils.replace_if_valid, hash)
end

local function rewrite()
  local rewriteDir = "mods/noita-streak-explorer/files/rewrite/"
  local hash = dofile_once(rewriteDir .. "hash.lua")

  replace(rewriteDir .. "data/scripts/biome_scripts.lua", hash.biome_scripts)
  replace(rewriteDir .. "data/scripts/items/potion.lua", hash.potion)
  replace(rewriteDir .. "data/scripts/items/potion_starting.lua", hash.potion_starting)
end

return {
  rewrite = rewrite,
}
