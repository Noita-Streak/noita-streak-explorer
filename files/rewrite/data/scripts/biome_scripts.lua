local function rewrite(replace_if_valid, hash)

  replace_if_valid("data/scripts/biome_scripts.lua", hash,
  {
    -- バレンタインデー
    -- ハートのスポーン率調整処理を無効化
    {from="( month == 2 ) and ( day == 14 )", to="false"},
  })
end

return {
  rewrite = rewrite,
}
