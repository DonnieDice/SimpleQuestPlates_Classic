--=====================================================================================
-- RGX | Simple Quest Plates! - enUS.lua

-- Author: DonnieDice
-- Description: English localization
--=====================================================================================

local addonName, SQP = ...
SQP.L = SQP.L or {}

-- Default English strings
local L = {
    -- Options Panel
    ["OPTIONS_ENABLE"] = "Enable",
    ["OPTIONS_DISABLE"] = "Disable",
    ["OPTIONS_DISPLAY"] = "Display Settings",
    ["OPTIONS_GENERAL"] = "General Settings",
    ["OPTIONS_ADDON_STATE"] = "Addon State",
    ["OPTIONS_DEBUG"] = "Enable Debug Mode",
    ["OPTIONS_CHAT_MESSAGES"] = "Show Chat Messages",
    ["OPTIONS_COMBAT"] = "Combat Settings",
    ["OPTIONS_HIDE_COMBAT"] = "Hide Icons in Combat",
    ["OPTIONS_HIDE_INSTANCE"] = "Hide Icons in Instances",
    ["OPTIONS_SCALE"] = "Icon Scale",
    ["OPTIONS_OFFSET_X"] = "Horizontal Offset",
    ["OPTIONS_OFFSET_Y"] = "Vertical Offset",
    ["OPTIONS_ICON_POSITION"] = "Icon Position",
    ["OPTIONS_ANCHOR"] = "Icon Position",
    ["OPTIONS_TEST"] = "Test Detection",
    ["OPTIONS_RESET"] = "Reset All Settings",
    ["OPTIONS_RESET_FONT"] = "Reset Font Settings",
    ["OPTIONS_RESET_ICON"] = "Reset Icon Settings",
    ["OPTIONS_FONT_SIZE"] = "Font Size",
    ["OPTIONS_FONT_FAMILY"] = "Font Family",
    ["OPTIONS_GLOBAL_SCALE"] = "Global Scale",
    ["OPTIONS_FONT_OUTLINE"] = "Text Outline",
    ["OPTIONS_CUSTOM_COLORS"] = "Use Custom Colors",
    ["OPTIONS_COLORS"] = "Colors",
    ["OPTIONS_TEXT_COLORS"] = "Quest Text Colors",
    ["OPTIONS_FONT_SETTINGS"] = "Font Settings",
    ["OPTIONS_OUTLINE_WIDTH"] = "Outline Width",
    ["OPTIONS_COLOR_KILL"] = "Kill Quests",
    ["OPTIONS_COLOR_ITEM"] = "Item Quests",
    ["OPTIONS_COLOR_PERCENT"] = "Progress Quests",
    ["OPTIONS_COLOR_OUTLINE"] = "Outline Color",
    ["OPTIONS_ICON_STYLE"] = "Icon Style",
    ["OPTIONS_ICON_TINT"] = "Enable Icon Tinting",
    ["OPTIONS_ICON_COLOR"] = "Icon Tint Color",
    ["OPTIONS_ICON_TINT_MAIN"] = "Enable Main Icon Tinting",
    ["OPTIONS_ICON_COLOR_MAIN"] = "Main Icon Tint Color",
    ["OPTIONS_ICON_TINT_QUEST"] = "Enable Quest Icon Tinting",
    ["OPTIONS_ICON_COLOR_QUEST"] = "Quest Icon Tint Color",
    ["OPTIONS_SHOW_KILL_ICON"] = "Show Kill Icon",
    ["OPTIONS_SHOW_LOOT_ICON"] = "Show Loot Icon",
    ["OPTIONS_QUEST_TYPE_ICONS"] = "Quest Type Icons",
    ["OPTIONS_ICON_OFFSETS"] = "Quest Type Icon Offsets",
    ["OPTIONS_ANIMATE_ICON"] = "Animate Main Icon",
    ["OPTIONS_RESET_MAIN_ICON"] = "Reset Main Icon Settings",
    ["OPTIONS_RESET_QUEST_ICONS"] = "Reset Quest Icon Settings",
    ["OPTIONS_KILL_ICON_OFFSET_X"] = "Kill X",
    ["OPTIONS_KILL_ICON_OFFSET_Y"] = "Kill Y",
    ["OPTIONS_LOOT_ICON_OFFSET_X"] = "Loot X",
    ["OPTIONS_LOOT_ICON_OFFSET_Y"] = "Loot Y",
    ["OPTIONS_SIZE"] = "Size",
    ["OPTIONS_POSITION"] = "Position",
    
    -- Commands
    ["CMD_ENABLED"] = "is now |cff00ff00ENABLED|r",
    ["CMD_DISABLED"] = "is now |cffff0000DISABLED|r",
    ["CMD_VERSION"] = "Simple Quest Plates version: |cff58be81%s|r",
    ["CMD_SCALE_SET"] = "Icon scale set to: |cff58be81%.1f|r",
    ["CMD_SCALE_INVALID"] = "|cffff0000Invalid scale value. Use a number between 0.5 and 2.0|r",
    ["CMD_OFFSET_SET"] = "Icon offset set to: |cff58be81X=%d, Y=%d|r",
    ["CMD_OFFSET_INVALID"] = "|cffff0000Invalid offset values. Use numbers between -50 and 50|r",
    ["CMD_RESET"] = "|cff58be81All settings have been reset to defaults|r",
    ["CMD_STATUS"] = "|cff58be81Simple Quest Plates Status:|r",
    ["CMD_STATUS_STATE"] = "  State: %s",
    ["CMD_STATUS_SCALE"] = "  Scale: |cff58be81%.1f|r",
    ["CMD_STATUS_OFFSET"] = "  Offset: |cff58be81X=%d, Y=%d|r",
    ["CMD_STATUS_ANCHOR"] = "  Position: |cff58be81%s|r",
    ["CMD_HELP_HEADER"] = "|cff58be81Simple Quest Plates Commands:|r",
    ["CMD_HELP_ENABLE"] = "  |cfffff569/sqp on|r - Enable the addon",
    ["CMD_HELP_DISABLE"] = "  |cfffff569/sqp off|r - Disable the addon",
    ["CMD_HELP_SCALE"] = "  |cfffff569/sqp scale <0.5-2.0>|r - Set icon scale",
    ["CMD_HELP_OFFSET"] = "  |cfffff569/sqp offset <x> <y>|r - Set icon offset (-50 to 50)",
    ["CMD_HELP_ANCHOR"] = "  |cfffff569/sqp anchor <LEFT|RIGHT>|r - Set icon anchor side",
    ["CMD_HELP_OPTIONS"] = "  |cfffff569/sqp options|r - Open options panel",
    ["CMD_HELP_TEST"] = "  |cfffff569/sqp test|r - Test quest detection",
    ["CMD_HELP_STATUS"] = "  |cfffff569/sqp status|r - Show current settings",
    ["CMD_HELP_RESET"] = "  |cfffff569/sqp reset|r - Reset all settings",
    ["CMD_HELP_VERSION"] = "  |cfffff569/sqp version|r - Show addon version",
    ["CMD_HELP_HELP"] = "  |cfffff569/sqp help|r - Show this help menu",
    ["CMD_TEST"] = "Testing quest detection...",
    ["CMD_OPTIONS_OPENED"] = "Options panel opened",
    ["TEST_SCANNING"] = "Testing quest detection...",
    
    -- Quest Detection
    ["QUEST_PROGRESS_KILL"] = "Kill: %d/%d",
    ["QUEST_PROGRESS_ITEM"] = "Collect: %d/%d",
    ["QUEST_TEST_ACTIVE"] = "Active quest objectives found: %d",
    ["QUEST_TEST_NONE"] = "No active quest objectives found",
    ["TEST_FOUND_QUESTS"] = "Found %d units with quest objectives",
    ["TEST_NO_QUESTS"] = "No quest objectives found on visible nameplates",
    
    -- Messages
    ["MSG_LOADED"] = "v%s loaded successfully. Type |cfffff569/sqp help|r for commands.",
    ["MSG_LOADED_LINE1"] = "Loaded successfully. Type |cfffff569/sqp help|r for commands.",
    ["MSG_LOADED_LINE2"] = "|cfffff569Version:|r |cff7598b6v%s|r",
    ["MSG_DISCORD"] = "Join our Discord: |cff58be81discord.gg/rgxmods|r",
    ["COMMUNITY_MESSAGE"] = "Join our Discord: |cff58be81discord.gg/rgxmods|r",
    ["SETTINGS_RESET"] = "|cff58be81All settings have been reset to defaults|r",
    ["SETTINGS_SCALE_SET"] = "Icon scale set to: |cff58be81%.1f|r",
    ["SETTINGS_OFFSET_SET"] = "Icon offset set to: |cff58be81X=%d, Y=%d|r",
    ["SETTINGS_ANCHOR_SET"] = "Anchor set to: |cff58be81%s|r",
    ["ERROR_INVALID_SCALE"] = "|cffff0000Invalid scale value. Use a number between 0.5 and 2.0|r",
    ["ERROR_INVALID_OFFSET"] = "|cffff0000Invalid offset values. Use numbers between -50 and 50|r",
    ["ERROR_INVALID_ANCHOR"] = "|cffff0000Invalid anchor. Use LEFT or RIGHT|r",
    ["ERROR_UNKNOWN_COMMAND"] = "|cffff0000Unknown command. Type /sqp help|r",
    ["ERROR_COMBAT_LOCKDOWN"] = "Cannot open options during combat.",
    ["STATUS_HEADER"] = "|cff58be81Simple Quest Plates Status:|r",
    ["STATUS_STATUS"] = "  State: %s",
    ["STATUS_ENABLED"] = "|cff00ff00ENABLED|r",
    ["STATUS_DISABLED"] = "|cffff0000DISABLED|r",
    ["STATUS_VERSION"] = "Simple Quest Plates version: |cff58be81%s|r",
    ["STATUS_SCALE"] = "  Scale: |cff58be81%.1f|r",
    ["STATUS_OFFSET"] = "  Offset: |cff58be81X=%d, Y=%d|r",
    ["STATUS_ANCHOR"] = "  Position: |cff58be81%s|r",
    ["ADDON_ENABLED"] = "is now |cff00ff00ENABLED|r",
    ["ADDON_DISABLED"] = "is now |cffff0000DISABLED|r",

    -- Minimap tooltip (routed from data/core.lua SetupMinimapButton)
    ["MINIMAP_TOOLTIP_OPEN_OPTIONS"] = "Open options",
    ["MINIMAP_TOOLTIP_MOVE"] = "Move around minimap",
    ["MINIMAP_TOOLTIP_HIDE"] = "Hide minimap icon",
    ["MINIMAP_ICON_SHOWN"] = "Minimap icon shown.",
    ["MINIMAP_ICON_HIDDEN"] = "Minimap icon hidden. Use |cfffff569/sqp icon on|r to show it again.",

    -- OnLogin loaded message (routed from data/core.lua RGX:OnLogin)
    ["MSG_CLASSIC_LOADED"] = "|cff58be81SimpleQuestPlates! Classic|r loaded. Type |cfffff569/sqp help|r for commands.",

    -- Compat-layer startup notice (routed from data/core.lua file-scope print)
    ["MSG_COMPAT_LAYER"] = "[SQP_Classic] Loaded with RGX-Framework compat layer",

    -- About panel (routed from data/options_about.lua)
    ["ABOUT_TITLE"] = "|cff8B1538RGX |cff58be81Simple Quest Plates!|r",
    ["ABOUT_FLAVOR"] = "Classic",
    ["ABOUT_AUTHOR"] = "|cff888888By DonnieDice \u00b7 donniedice@protonmail.com|r",
    ["ABOUT_DESCRIPTION"] = "Displays quest progress icons on enemy nameplates.\nPer-type colors, tinting, font, and animation.",
    ["ABOUT_COMMUNITY_TITLE"] = "|cff58be81RGX Mods Community|r",
    ["ABOUT_COMMUNITY_DESC"] = "Join us for support, feedback, and more!",
    ["ABOUT_COMMUNITY_LINK"] = "|cffffffdadiscord.gg/rgxmods|r",
    ["ABOUT_SLASH_TITLE"] = "|cff58be81Slash Commands  |cffaaaaaa/sqp|r",
    ["ABOUT_CMD_OPTIONS"] = "Open options panel",
    ["ABOUT_CMD_ONOFF"] = "Enable or disable",
    ["ABOUT_CMD_TEST"] = "Test quest detection",
    ["ABOUT_CMD_RESET"] = "Reset all settings",
    ["ABOUT_CMD_STATUS"] = "Show current settings",
    ["ABOUT_CMD_SCALE"] = "Set icon scale",
    ["ABOUT_CMD_OFFSET"] = "Set X / Y offset",
}

-- Set English as default
for k, v in pairs(L) do
    SQP.L[k] = v
end
