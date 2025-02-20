local function rewrite(replace_if_valid, hash)
  replace_if_valid("data/scripts/items/potion.lua", hash, {
    -- バレンタインデー
    -- フェロモンのスポーン率調整処理の無効化
    { from = "month == 2 and day == 14", to = "false" },
    -- イースター
    -- mammiポーション発生率調整処理の無効化
    { from = "if( mammi", to = "if( false" },
    -- Vappu
    -- sima / beerポーション発生率調整処理の無効化
    { from = "(( month == 5 ) and ( day == 1 )) or (( month == 4 ) and ( day == 30 ))", to = "false" },
  })
end

return {
  rewrite = rewrite,
}
