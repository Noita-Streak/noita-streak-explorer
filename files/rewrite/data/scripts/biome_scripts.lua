local function rewrite(replaceIfValid, hash)
  -- ハートのスポーン率
  replaceIfValid("data/scripts/biome_scripts.lua", hash, "( month == 2 ) and ( day == 14 )", "false")
end

return {
  rewrite = rewrite,
}
