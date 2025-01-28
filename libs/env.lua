--[[
https://github.com/mcjkula/lua-dotenv

MIT License

Copyright (c) 2024 Maciej Kula

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local M = {}
local env_vars = {}

function M.get(key, default)
  local value = env_vars[key] or os.getenv(key)
  return value or default
end

function M.load_dotenv(file_path)
  file_path = file_path or os.getenv("HOME") .. "/.config/.env"
  local file, _ = io.open(file_path, "r")
  if not file then
    return
  end

  local content = file:read("*all")
  file:close()

  for line in content:gmatch("[^\r\n]+") do
    local key, value = line:match("^([%w_]+)%s*=%s*(.+)$")
    if key and value then
      value = value:gsub("^[\"'](.-)[\"']$", "%1")
      env_vars[key] = value
    end
  end
end

return M
