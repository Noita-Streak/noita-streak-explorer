local function rewrite()
  -- borrowed from time travel mod
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=2937008418&searchtext=travel
  local function replace(file, expectedHash, target, text)
    local content = ModTextFileGetContent(file)
    if not content then
      print(table.concat({ "INJECTION (REPLACE) FAILED: NO FILE\nFile: ", file, "\nTarget: ", target, "\nText: ", text }))
      return
    end

    local md5 = dofile_once("mods/noita-streak-explorer/libs/md5/md5.lua")

    local result = md5.sumhexa(content)
    local valid = result == expectedHash
    if not valid then
      error("Rewrote noita file " .. file)
      return
    end

    -- local first, last = content:find(target, 0, true)
    -- if not first then
    --   print(table.concat({ "INJECTION (REPLACE) FAILED: NO HOOK\nFile: ", file, "\nTarget: ", target, "\nText: ", text }))
    --   return
    -- end
    -- local before = content:sub(1, first - 1)
    -- local after = content:sub(last + 1)
    local new = content:gsub(target, text)
    ModTextFileSetContent(file, new)
    if false then
      print(table.concat({ "Injected (replace) ", text, " in ", file, " at ", target, " causing:\n", new, "\nfrom: \n", content }))
    end
    if content == new then
      print(table.concat({ "INJECTION (REPLACE) FAILED: NO CHANGE\nFile: ", file, "\nTarget: ", target, "\nText: ", text }))
    end
  end

  local hash = dofile_once("mods/noita-streak-explorer/files/scripts/rewrite/hash.lua")

  -- バレンタインデー
  replace("data/scripts/biome_scripts.lua", hash.biome_scripts, "( month == 2 ) and ( day == 14 )", "false")
  replace("data/scripts/items/potion.lua", hash.potion, "month == 2 and day == 14", "false")

  --TODO バレンタインデー以外の無効化を実装する
end

return {
  rewrite = rewrite,
  --rewrite_code = rewrite_code,
}
