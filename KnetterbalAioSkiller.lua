<<<<<<< HEAD
local API = require("api")
local GUI = require("Knetter AIO Skiller.gui")
local DATA = require("Knetter AIO Skiller.data")
local UTILS = require("utils")

API.SetDrawLogs(true)
API.SetDrawTrackedSkills(true)

ScriptName = "Knetterbal AIO Skiller"
Author = "Knetterbal"
ScriptVersion = "1.0"
ReleaseDate = "21-08-2025"


local RES = DATA.resolve()

local selectedSkill = RES.selectedSkill
local subSkill = RES.subSkill
local selectedFish = RES.selectedFish
local selectedLog = RES.selectedLog
local selectedBow = RES.selectedBow
local selectedArrow = RES.selectedArrow
local bowStyle = RES.bowStyle

-- ==== GUI ====
local function BuildGUI()
    GUI.AddBackground("main_background", 0.5, 6, ImColor.new(15, 13, 18, 255))
    GUI.AddLabel("title_label", "Knetterbal AIO Skiller", ImColor.new(255, 255, 255))
    GUI.AddLabel("version_label", "Version: " .. ScriptVersion, ImColor.new(255, 255, 255))
    GUI.AddButton("start_button", "Start/Pause Script")
end

local function isStarted()
    local btn = GUI.GetComponent("start_button")
    return btn and btn.return_click or false
end

-- ==== HELPERS ====
local function gameStateChecks()
    local gameState = API.GetGameState2()
    if gameState ~= 3 then
        API.logDebug("Not ingame with state: " .. tostring(gameState))
        return false
    end
    if not API.PlayerLoggedIn() then
        API.logDebug("Not Logged In")
        return false
    end
    return true
end

local function findItemInInventory(itemId)
    if not itemId then
        return nil
    end
    local inventory = API.ReadInvArrays33()
    for i = 1, #inventory do
        if inventory[i].itemid1 == itemId then
            return inventory[i]
        end
    end
    return nil
end

local function HasItemMin(item, min)
    min = min or 1
    local amount = 0
    if Inventory and Inventory.GetItemAmount then
        amount = Inventory:GetItemAmount(item) or 0
    else
        local count = API.InvItemcount_1(item) or 0
        local stack = API.InvStackSize(item) or 0
        amount = math.max(count, stack)
    end
    return amount >= min
end

local function hasMaterials()
    if selectedSkill == "FLETCHING" then
        if subSkill == "FLETCH" then
            return findItemInInventory(selectedLog) ~= nil

        elseif subSkill == "STRING" then
            local bowstringId = 1777
            return findItemInInventory(selectedBow) and findItemInInventory(bowstringId)

        elseif subSkill == "HEADLESS" then
            return HasItemMin(52, 15) and HasItemMin(314, 15)

        elseif subSkill == "ARROWS" then
            return HasItemMin(53, 15) and (selectedArrow and HasItemMin(selectedArrow, 15))
        end

    elseif selectedSkill == "COOKING" then
        return findItemInInventory(selectedFish) ~= nil

    elseif selectedSkill == "FIREMAKING" then
        return findItemInInventory(selectedLog) ~= nil

    elseif selectedSkill == "CRAFTING" then
        return findItemInInventory(selectedLog) ~= nil
    end
    return false
end

local function isInterfaceOpen()
    return API.Compare2874Status(18)
end

local function loadLastPreset()

    if selectedSkill == "FLETCHING" or selectedSkill == "COOKING" then
        API.logDebug("Loading last preset")
        API.DoAction_Object1(0x33, API.OFF_ACT_GeneralObject_route3, {125720, 125734}, 50)

    elseif selectedSkill == "FIREMAKING" then

        API.DoAction_NPC(0x33, API.OFF_ACT_InteractNPC_route4, {19916}, 50)
        API.logDebug("Loading Firemaking preset")

    end
end

local function startCraft()
    API.KeyboardPress2(0x20, 100, 50)
end

local function isBusy()
    return API.CheckAnim(20) or API.isProcessing()
end
local function isBurningLogs()
    return API.CheckAnim(100) or API.isProcessing()
end

local function startWorking()

    if selectedSkill == "COOKING" and not isBusy() then
        API.DoAction_Object1(0x40, API.OFF_ACT_GeneralObject_route0, {125205}, 50)
    elseif selectedSkill == "FLETCHING" and not isBusy() then
        API.DoAction_Object1(0xcd, API.OFF_ACT_GeneralObject_route0, {125718}, 50)
    elseif selectedSkill == "FIREMAKING" and not isBurningLogs() then
        API.DoAction_Object1(0x41, API.OFF_ACT_GeneralObject_route0, {110269}, 50)

    end
end

-- ==== START ====
BuildGUI()

API.logDebug(("Knetterbal AIO Skiller started with skill: %s  and sub-skill: %s"):format(tostring(selectedSkill),
    tostring(subSkill)))
API.logDebug(("Selected Fish: %s  Selected Log: %s  Selected Bow: %s  Selected Arrow: %s"):format(
    tostring(selectedFish), tostring(selectedLog), tostring(selectedBow), tostring(selectedArrow)))
API.logDebug(("Bow Style: %s  Bowstring ID: %s"):format(tostring(bowStyle), tostring(bowstringId)))

local fails = 0

while API.Read_LoopyLoop() do
    GUI.Draw()
    API.DoRandomEvents()

    if not gameStateChecks() then
        goto continue
    end

    if isStarted() then

        if not hasMaterials() then
            loadLastPreset()

            API.RandomSleep2(500, 700, 800)
            fails = fails + 1
            if fails > 4 then
                API.logDebug("Failed to find materials 3 times, stopping script.")
                API.Write_LoopyLoop(false)
            end
        else

            fails = 0
        end
        if isInterfaceOpen() then
            API.RandomSleep2(100, 50, 100)
            startCraft()
        else
            startWorking()
            API.RandomSleep2(1000, 500, 1000)
        end

    end

    ::continue::
    API.RandomSleep2(500, 700, 800)
end
=======
local API = require("api")
local GUI = require("Knetter AIO Skiller.gui")
local DATA = require("Knetter AIO Skiller.data")
local ConfR = require("Knetter AIO Skiller.resolver")
local CFG = rawget(_G, "CONFIG") or {}
local UTILS = require("utils")

API.SetDrawLogs(true)
API.SetDrawTrackedSkills(true)

ScriptName = "Knetterbal AIO Skiller"
Author = "Knetterbal"
ScriptVersion = "1.0"
ReleaseDate = "19-08-2025"


local RES = DATA.resolve()

local selectedSkill = RES.selectedSkill
local subSkill = RES.subSkill
local selectedFish = RES.selectedFish
local selectedLog = RES.selectedLog
local selectedBow = RES.selectedBow
local selectedArrow = RES.selectedArrow
local bowStyle = RES.bowStyle

-- ==== GUI ====
local function BuildGUI()
    GUI.AddBackground("main_background", 0.5, 6, ImColor.new(15, 13, 18, 255))
    GUI.AddLabel("title_label", "Knetterbal AIO Skiller", ImColor.new(255, 255, 255))
    GUI.AddLabel("version_label", "Version: " .. ScriptVersion, ImColor.new(255, 255, 255))
    GUI.AddButton("start_button", "Start/Pause Script")
end

local function isStarted()
    local btn = GUI.GetComponent("start_button")
    return btn and btn.return_click or false
end

-- ==== HELPERS ====
local function gameStateChecks()
    local gameState = API.GetGameState2()
    if gameState ~= 3 then
        API.logDebug("Not ingame with state: " .. tostring(gameState))
        return false
    end
    if not API.PlayerLoggedIn() then
        API.logDebug("Not Logged In")
        return false
    end
    return true
end

local function findItemInInventory(itemId)
    if not itemId then
        return nil
    end
    local inventory = API.ReadInvArrays33()
    for i = 1, #inventory do
        if inventory[i].itemid1 == itemId then
            return inventory[i]
        end
    end
    return nil
end

local function HasItemMin(item, min)
    min = min or 1
    local amount = 0
    if Inventory and Inventory.GetItemAmount then
        amount = Inventory:GetItemAmount(item) or 0
    else
        local count = API.InvItemcount_1(item) or 0
        local stack = API.InvStackSize(item) or 0
        amount = math.max(count, stack)
    end
    return amount >= min
end

local function hasMaterials()
    if selectedSkill == "FLETCHING" then
        if subSkill == "FLETCH" then
            return findItemInInventory(selectedLog) ~= nil

        elseif subSkill == "STRING" then
            local bowstringId = 1777
            return findItemInInventory(selectedBow) and findItemInInventory(bowstringId)

        elseif subSkill == "HEADLESS" then
            return HasItemMin(52, 15) and HasItemMin(314, 15)

        elseif subSkill == "ARROWS" then
            return HasItemMin(53, 15) and (selectedArrow and HasItemMin(selectedArrow, 15))
        end

    elseif selectedSkill == "COOKING" then
        return findItemInInventory(selectedFish) ~= nil

    elseif selectedSkill == "FIREMAKING" then
        return findItemInInventory(selectedLog) ~= nil

    elseif selectedSkill == "CRAFTING" then
        return findItemInInventory(selectedLog) ~= nil
    end
    return false
end

local function isInterfaceOpen()
    return API.Compare2874Status(18)
end

local function loadLastPreset()

    if selectedSkill == "FLETCHING" or selectedSkill == "COOKING" then
        API.logDebug("Loading last preset")
        API.DoAction_Object1(0x33, API.OFF_ACT_GeneralObject_route3, {125720, 125734}, 50)

    elseif selectedSkill == "FIREMAKING" then

        API.DoAction_NPC(0x33, API.OFF_ACT_InteractNPC_route4, {19916}, 50)
        API.logDebug("Loading Firemaking preset")

    end
end

local function startCraft()
    API.KeyboardPress2(0x20, 100, 50)
end

local function isBusy()
    return API.CheckAnim(20) or API.isProcessing()
end
local function isBurningLogs()
    return API.CheckAnim(100) or API.isProcessing()
end

local function startWorking()

    if selectedSkill == "COOKING" and not isBusy() then
        API.DoAction_Object1(0x40, API.OFF_ACT_GeneralObject_route0, {125205}, 50)
    elseif selectedSkill == "FLETCHING" and not isBusy() then
        API.DoAction_Object1(0xcd, API.OFF_ACT_GeneralObject_route0, {125718}, 50)
    elseif selectedSkill == "FIREMAKING" and not isBurningLogs() then
        API.DoAction_Object1(0x41, API.OFF_ACT_GeneralObject_route0, {110269}, 50)

    end
end

-- ==== START ====
BuildGUI()

API.logDebug(("Knetterbal AIO Skiller started with skill: %s  and sub-skill: %s"):format(tostring(selectedSkill),
    tostring(subSkill)))
API.logDebug(("Selected Fish: %s  Selected Log: %s  Selected Bow: %s  Selected Arrow: %s"):format(
    tostring(selectedFish), tostring(selectedLog), tostring(selectedBow), tostring(selectedArrow)))
API.logDebug(("Bow Style: %s  Bowstring ID: %s"):format(tostring(bowStyle), tostring(bowstringId)))
API.logDebug(("CFG sel=%s sub=%s log=%s arrow=%s bow=%s mat1=%s fish=%s"):format(tostring(CFG.selectedSkill),
    tostring(CFG.subSkill), tostring(CFG.logType), tostring(CFG.arrowheadType), tostring(CFG.bowType),
    tostring(CFG.bowMaterial1), tostring(CFG.fishType)))

local fails = 0

while API.Read_LoopyLoop() do
    GUI.Draw()
    API.DoRandomEvents()

    if not gameStateChecks() then
        goto continue
    end

    if isStarted() then

        if not hasMaterials() then
            loadLastPreset()

            API.RandomSleep2(500, 700, 800)
            fails = fails + 1
            if fails > 4 then
                API.logDebug("Failed to find materials 3 times, stopping script.")
                API.Write_LoopyLoop(false)
            end
        else

            fails = 0
        end
        if isInterfaceOpen() then
            API.RandomSleep2(100, 50, 100)
            startCraft()
        else
            startWorking()
            API.RandomSleep2(1000, 500, 1000)
        end

    end

    ::continue::
    API.RandomSleep2(500, 700, 800)
end
>>>>>>> 3714bb59b834c62544d3d7b949349b2698273340
