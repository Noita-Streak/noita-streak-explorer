local function exec()
  -- 見やすくするために改行
  print("\n\n\n\n")

  function describe(title, callback)
    print("=======================================================")
    print("START: " .. title)
    callback()
    print("END: " .. title)
    print("=======================================================")
  end

  function test(test_name, callback)
    local is_success, error_message = pcall(callback)
    if is_success then
      print("SUCCESS: " .. test_name)
    else
      print("FAILED: " .. test_name)
      error(error_message)
    end
  end

  -- Test alias
  function it(test_name, callback)
    test(test_name, callback)
  end

  dofile_once("mods/noita-streak-explorer/spec/rewrite/entry_spec.lua")
end

return {
  exec = exec,
}
