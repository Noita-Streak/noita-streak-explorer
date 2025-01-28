-- borrowed from time travel mod
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2937008418&searchtext=travel
local function replace_if_valid(file, expectedHash, from, to)
  local content = ModTextFileGetContent(file)
  if not content then
    error(table.concat({ "INJECTION (REPLACE) FAILED: NO FILE/nFile: ", file, "/nFrom: ", from, "/nTo: ", to }))
    return
  end

  local md5 = dofile_once("mods/noita-streak-explorer/libs/md5/md5.lua")
  local result = md5.sumhexa(content)
  local valid = result == expectedHash
  if not valid then
    error(table.concat({ "INJECTION (REPLACE) FAILED: INVALID HASH/nFile: ", file, "/nFrom: ", from, "/nTo: ", to }))
    return
  end

  local first, last = content:find(from, 0, true)
  if not first then
    error(table.concat({ "INJECTION (REPLACE) FAILED: NO HOOK/nFile: ", file, "/nFrom: ", from, "/nTo: ", to }))
    return
  end

  local before = content:sub(1, first - 1)
  local after = content:sub(last + 1)
  local new = before .. to .. after
  if content == new then
    error(table.concat({ "INJECTION (REPLACE) FAILED: NO CHANGE/nFile: ", file, "/nFrom: ", from, "/nTo: ", to }))
    return
  end

  ModTextFileSetContent(file, new)
end

local function rewrite()
  local hash = dofile_once("mods/noita-streak-explorer/files/rewrite/hash.lua")

  -- バレンタインデー無効化
  dofile_once("mods/noita-streak-explorer/files/rewrite/data/scripts/biome_scripts.lua").rewrite(replace_if_valid, hash.biome_scripts)
  dofile_once("mods/noita-streak-explorer/files/rewrite/data/scripts/items/potion.lua").rewrite(replace_if_valid, hash.potion)

  --TODO バレンタインデー以外の無効化を実装する
end

return {
  rewrite = rewrite,
}
