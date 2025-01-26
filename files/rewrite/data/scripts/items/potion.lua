local function rewrite(replaceIfValid, hash)
  -- フェロモンのスポーン率
  replaceIfValid("data/scripts/items/potion.lua", hash, "month == 2 and day == 14", "false")
end

return {
  rewrite = rewrite,
}
