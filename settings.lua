dofile("data/scripts/lib/mod_settings.lua")

local mod_id = "noita-streak-explorer"
local is_selected_custom_game_mode = false
mod_settings_version = 1

-- Localize
local function language()
  local current_language = GameTextGet("$current_language")
  if current_language == "English" then
    return "en"
  end
  if current_language == "русский" then
    return "ru"
  end
  if current_language == "Português (Brasil)" then
    return "pt-br"
  end
  if current_language == "Español" then
    return "es-es"
  end
  if current_language == "Deutsch" then
    return "de"
  end
  if current_language == "Français" then
    return "fr-fr"
  end
  if current_language == "Italiano" then
    return "it"
  end
  if current_language == "Polska" then
    return "pl"
  end
  if current_language == "简体中文" then
    return "zh-cn"
  end
  if current_language == "日本語" then
    return "ja"
  end
  if current_language == "한국어" then
    return "ko"
  end

  return "en"
end

local settings_text = {
  streak_mode = {
    ui_name = {
      ja = "選択されているレギュレーション",
    },
    ui_description = {
      ja = "遊ぶレギュレーションを選択してください",
    },
  },
  customize_game_mode = {
    ui_name = {
      ja = "詳細設定",
    },
    ui_description = {
      ja = "",
    },
  },
}

local function mod_setting_change_game_mode_callback(_mod_id, _gui, _in_main_menu, _game_mode_setting, _old_mode_name, new_mode_name)
  is_selected_custom_game_mode = new_mode_name == "custom"
end

mod_settings = {
  {
    id = "streak_mode",
    ui_name = settings_text.streak_mode.ui_name[language()],
    ui_description = settings_text.streak_mode.ui_description[language()],
    value_default = "normal",
    values = { { "normal", "normal" }, { "nightmare", "nightmare" }, { "custom", "custom" } },
    scope = MOD_SETTING_SCOPE_NEW_GAME,
    change_fn = mod_setting_change_game_mode_callback,
  },
}

local mod_settings_detail = {
  category_id = "customize_game_mode",
  ui_name = settings_text.customize_game_mode.ui_name[language()],
  ui_description = settings_text.customize_game_mode.ui_description[language()],
  foldable = false,
  _folded = false,
  settings = {
    -- NOTE: ここにストリークの各オプションを書いていく
    {
      id = "world_size2",
      ui_name = "World size 2",
      ui_description = "How much world do you want?",
      value_default = "small",
      values = { { "small", "Small" }, { "medium", "Medium" }, { "huge", "Huge" } },
      scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
  },
}

local function draw_detail_when_custom_mode(target_mod_settings)
  local exists_customize_game_mode = false
  local customize_game_mode_table_pos = nil

  for i, setting in ipairs(target_mod_settings) do
    if setting.category_id then
      if setting.category_id == "customize_game_mode" then
        exists_customize_game_mode = true
        customize_game_mode_table_pos = i
      end
    end
  end

  if is_selected_custom_game_mode then
    if not exists_customize_game_mode then
      table.insert(target_mod_settings, mod_settings_detail)
    end
  else
    if exists_customize_game_mode then
      if customize_game_mode_table_pos == nil then
        error("target is not found")
      end
      table.remove(mod_settings, customize_game_mode_table_pos)
    end
  end
end

-- This function is called to ensure the correct setting values are visible to the game via ModSettingGet(). your mod's settings don't work if you don't have a function like this defined in settings.lua.
-- This function is called:
--		- when entering the mod settings menu (init_scope will be MOD_SETTINGS_SCOPE_ONLY_SET_DEFAULT)
-- 		- before mod initialization when starting a new game (init_scope will be MOD_SETTING_SCOPE_NEW_GAME)
--		- when entering the game after a restart (init_scope will be MOD_SETTING_SCOPE_RESTART)
--		- at the end of an update when mod settings have been changed via ModSettingsSetNextValue() and the game is unpaused (init_scope will be MOD_SETTINGS_SCOPE_RUNTIME)
-- selene: allow(unused_variable)
function ModSettingsUpdate(init_scope)
  local old_version = mod_settings_get_version(mod_id) -- This can be used to migrate some settings between mod versions.
  mod_settings_update(mod_id, mod_settings, init_scope)
end

-- This function should return the number of visible setting UI elements.
-- Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
-- If your mod changes the displayed settings dynamically, you might need to implement custom logic.
-- The value will be used to determine whether or not to display various UI elements that link to mod settings.
-- At the moment it is fine to simply return 0 or 1 in a custom implementation, but we don't guarantee that will be the case in the future.
-- This function is called every frame when in the settings menu.
-- selene: allow(unused_variable)
function ModSettingsGuiCount()
  draw_detail_when_custom_mode(mod_settings)
  return mod_settings_gui_count(mod_id, mod_settings)
end

-- This function is called to display the settings UI for this mod. Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
-- selene: allow(unused_variable)
function ModSettingsGui(gui, in_main_menu)
  mod_settings_gui(mod_id, mod_settings, gui, in_main_menu)
end
