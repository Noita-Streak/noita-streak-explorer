dofile("data/scripts/lib/mod_settings.lua")

-- local mod_id = "noita-streak-explorer"
-- mod_settings_version = 1

-- -- Localize
-- local function language()
--   local current_language = GameTextGet("$current_language")
--   if current_language == "English" then
--     return "en"
--   end
--   if current_language == "русский" then
--     return "ru"
--   end
--   if current_language == "Português (Brasil)" then
--     return "pt-br"
--   end
--   if current_language == "Español" then
--     return "es-es"
--   end
--   if current_language == "Deutsch" then
--     return "de"
--   end
--   if current_language == "Français" then
--     return "fr-fr"
--   end
--   if current_language == "Italiano" then
--     return "it"
--   end
--   if current_language == "Polska" then
--     return "pl"
--   end
--   if current_language == "简体中文" then
--     return "zh-cn"
--   end
--   if current_language == "日本語" then
--     return "ja"
--   end
--   if current_language == "한국어" then
--     return "ko"
--   end

--   return "en"
-- end

-- local settings_text = {
--   valentines = {
--     ui_name = {
--       ja = "呪文エディタショートカットキー",
--     },
--     ui_description = {
--       ja = "ショートカットキーを入力してください(a-z0-9)",
--     },
--   },
-- }

mod_settings = {
  -- サンプル
  -- {
  --   id = "valentines",
  --   ui_name = settings_text.valentines.ui_name[language()],
  --   ui_description = settings_text.valentines.ui_description[language()],
  --   value_default = false,
  --   scope = MOD_SETTING_SCOPE_RUNTIME,
  -- },
}

-- function mod_setting_bool_custom(mod_id, gui, in_main_menu, im_id, setting)
--   local value = ModSettingGetNextValue(mod_setting_get_id(mod_id, setting))
--   local text = setting.ui_name .. " - " .. GameTextGet(value and "$option_on" or "$option_off")

--   if GuiButton(gui, im_id, mod_setting_group_x_offset, 0, text) then
--     ModSettingSetNextValue(mod_setting_get_id(mod_id, setting), not value, false)
--   end

--   mod_setting_tooltip(mod_id, gui, in_main_menu, setting)
-- end

-- function mod_setting_change_callback(mod_id, gui, in_main_menu, setting, old_value, new_value)
--   print(tostring(new_value))
-- end

-- This function is called to ensure the correct setting values are visible to the game via ModSettingGet(). your mod's settings don't work if you don't have a function like this defined in settings.lua.
-- This function is called:
--		- when entering the mod settings menu (init_scope will be MOD_SETTINGS_SCOPE_ONLY_SET_DEFAULT)
-- 		- before mod initialization when starting a new game (init_scope will be MOD_SETTING_SCOPE_NEW_GAME)
--		- when entering the game after a restart (init_scope will be MOD_SETTING_SCOPE_RESTART)
--		- at the end of an update when mod settings have been changed via ModSettingsSetNextValue() and the game is unpaused (init_scope will be MOD_SETTINGS_SCOPE_RUNTIME)
-- function ModSettingsUpdate(init_scope)
--   local old_version = mod_settings_get_version(mod_id) -- This can be used to migrate some settings between mod versions.
--   mod_settings_update(mod_id, mod_settings, init_scope)
-- end

-- This function should return the number of visible setting UI elements.
-- Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
-- If your mod changes the displayed settings dynamically, you might need to implement custom logic.
-- The value will be used to determine whether or not to display various UI elements that link to mod settings.
-- At the moment it is fine to simply return 0 or 1 in a custom implementation, but we don't guarantee that will be the case in the future.
-- This function is called every frame when in the settings menu.
-- function ModSettingsGuiCount()
--   return mod_settings_gui_count(mod_id, mod_settings)
-- end

-- This function is called to display the settings UI for this mod. Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
-- function ModSettingsGui(gui, in_main_menu)
--   mod_settings_gui(mod_id, mod_settings, gui, in_main_menu)
-- end
