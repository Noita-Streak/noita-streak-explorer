local target = dofile("/github/workspace/files/scripts/rewrite/perks/glass_cannon_enemy.lua")

local test_items = {
  {
    title = "ダメージが0.2 * 3.0に置換されていること",
    input = { "damage = damage * 3.0" },
    output = { "damage = damage * 0.2 * 3.0" },
  },
  {
    title = "タイプダメージが0.2 * 3.0に置換されていること",
    input = { "v = v * 3.0" },
    output = { "v = v * 0.2 * 3.0" },
  },
  {
    title = "爆破設定が0.2 * 4.0に、nilの場合に読み込まない形に置換されていること",
    input = { "v = v * 4.0" },
    output = { "if (v ~= nil) then v = v * 0.2 * 4.0" },
  },
  {
    title = "endが追加されていること",
    input = { 'ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) )' },
    output = { 'ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) ) end' },
  },
}

describe("code replace test", function()
  for _, test_case in ipairs(test_items) do
    it(test_case.title, function()
      local result = target.rewrite_code(test_case.input[1])
      assert.are.same(result, test_case.output[1])
    end)
  end
end)
