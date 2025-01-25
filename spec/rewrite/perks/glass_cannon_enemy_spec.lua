local lu = dofile_once("mods/noita-streak-explorer/libs/luaunit/luaunit.lua")
local target = dofile_once("mods/noita-streak-explorer/files/scripts/rewrite/perks/glass_cannon_enemy.lua")

local test_items = {
  {
    -- NOTE: ダメージが0.2 * 3.0に置換されていること
    title = "Replaced to [0.2 * 3.0]",
    input = { "damage = damage * 3.0" },
    output = { "damage = damage * 0.2 * 3.0" },
  },
  {
    -- NOTE: タイプダメージが0.2 * 3.0に置換されていること
    title = "Type damage replaced to [0.2 * 3.0]",
    input = { "v = v * 3.0" },
    output = { "v = v * 0.2 * 3.0" },
  },
  {
    -- NOTE: 爆破設定が0.2 * 4.0に、nilの場合に読み込まない形に置換されていること
    title = "Explosive setting replaced to [0.2 * 4.0] and add if statement",
    input = { "v = v * 4.0" },
    output = { "if (v ~= nil) then v = v * 0.2 * 4.0" },
  },
  {
    -- NOTE: endが追加されていること
    title = "Add end statement",
    input = { 'ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) )' },
    output = { 'ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) ) end' },
  },
}

describe("code replace test", function()
  for _, test_case in ipairs(test_items) do
    test(test_case.title, function()
      local result = target.rewrite_code(test_case.input[1])
      lu.assertEquals(result, test_case.output[1])
    end)
  end
end)
