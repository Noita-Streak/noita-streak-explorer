local function rewrite(replace_if_valid, hash)
  replace_if_valid("data/scripts/items/potion_starting.lua", hash, {
    -- Vappu
    -- simaポーション発生率調整処理の無効化
    { from = "(( month == 5 ) and ( day == 1 )) or (( month == 4 ) and ( day == 30 ))", to = "false" },
  })
end

return {
  rewrite = rewrite,
}
