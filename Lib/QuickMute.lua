--[[----------------------------------------------
    Project:    QuickMute
    Author:     Arne Rantzen (Tyx)
    Created:    2020-03-08
    Updated:    020-03-08
    License:    GPL-3.0
----------------------------------------------]]--
-- -----------------------------------------
-- Bindings
-- -----------------------------------------
local values = {}

--- Function to set a setting to a value
--- @param setting number of global setting
--- @param name string of value
local function SetAudio(setting, name)
    local value
    if values[name] then
        value = values[name]
        values[name] = nil
    else
        values[name] = GetSetting(SETTING_TYPE_AUDIO, setting)
        value = values[name]
        if value == '1' then
            value = '0'
        else
            value = '1'
        end
    end
    SetSetting(SETTING_TYPE_AUDIO, setting, value, DO_NOT_SAVE_TO_PERSISTED_DATA)
    -- d(zo_strformat(QuickMute.i18n.print, QuickMute.i18n["toggle_" .. name], value))
end

--- Function to toggle the in-game sound
function QUICK_MUTE_TOGGLE_SOUND()
    SetAudio(AUDIO_SETTING_SOUND_ENABLED, "sound")
end

--- Function to toggle the in-game music
function QUICK_MUTE_TOGGLE_MUSIC()
    SetAudio(AUDIO_SETTING_MUSIC_ENABLED, "music")
end

--- Function to toggle the in-game audio
function QUICK_MUTE_TOGGLE_AUDIO()
    SetAudio(AUDIO_SETTING_AUDIO_ENABLED, "audio")
end