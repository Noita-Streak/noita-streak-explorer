local function replace_if_valid(file, expectedHash, fromToTable)
  local content = ModTextFileGetContent(file)
  if not content then
    error(table.concat({ "INJECTION (REPLACE) FAILED: NO FILE/nFile: ", file }))
    return
  end

  local md5 = dofile_once("mods/noita-streak-explorer/libs/md5/md5.lua")
  local result = md5.sumhexa(content)
  local valid = result == expectedHash
  if not valid then
    error(table.concat({ "INJECTION (REPLACE) FAILED: INVALID HASH/nFile: ", file }))
    return
  end

  for _, pattern in pairs(fromToTable) do
    local first, last = content:find(pattern.from, 0, true)
    if not first then
      error(table.concat({ "INJECTION (REPLACE) FAILED: NO HOOK/nFile: ", file, "/nFrom: ", pattern.from, "/nTo: ", pattern.to }))
      return
    end

    local before = content:sub(1, first - 1)
    local after = content:sub(last + 1)
    local new = before .. pattern.to .. after
    if content == new then
      error(table.concat({ "INJECTION (REPLACE) FAILED: NO CHANGE/nFile: ", file, "/nFrom: ", pattern.from, "/nTo: ", pattern.to }))
      return
    end
    content = new
  end
  ModTextFileSetContent(file, content)
end

return {
  replace_if_valid = replace_if_valid,
}
