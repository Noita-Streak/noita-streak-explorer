local function rewrite(replace_if_valid, hash)
  replace_if_valid("data/scripts/items/potion.lua", hash, {
    -- バレンタインデー
    -- フェロモンのスポーン率調整処理の無効化
    { from = "month == 2 and day == 14", to = "false" },
    -- イースター
    -- mammiポーション発生率調整処理の無効化
    { from = "if( mammi", to = "if( false" },
  })
end

return {
  rewrite = rewrite,
}
