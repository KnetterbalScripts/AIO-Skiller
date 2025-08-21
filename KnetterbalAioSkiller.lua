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
local selectedArrow = RES.selectedArrow
local bowMaterial1 = RES.bowMaterial1
local bowMaterial2 = RES.bowMaterial2
local subSkill2 = RES.subSkill2
local uncut = RES.uncut
local selectedSandstone = RES.selectedSandstone
local selectedGlass = RES.selectedGlass
local selectedLeather = RES.selectedLeather
local armorType = RES.armorType

-- === SETTINGS ===--
local fletchingTable = {125718}
local cookingRange = {125205}
local bonfire = {110269}
local glassMaker = {94067}

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

            local unfShort = bowMaterial1 and DATA.SHORTBOW[bowMaterial1] or nil
            local unfLong = bowMaterial2 and DATA.SHIELDBOW[bowMaterial2] or nil
            return ((unfShort and findItemInInventory(unfShort)) or (unfLong and findItemInInventory(unfLong))) and
                       findItemInInventory(bowstringId)

        elseif subSkill == "HEADLESS" then
            return HasItemMin(52, 15) and HasItemMin(314, 15)

        elseif subSkill == "ARROWS" then
            return HasItemMin(53, 15) and HasItemMin(selectedArrow, 15)
        end

    elseif selectedSkill == "COOKING" then
        return findItemInInventory(selectedFish) ~= nil

    elseif selectedSkill == "FIREMAKING" then
        return findItemInInventory(selectedLog) ~= nil

    elseif selectedSkill == "CRAFTING" then
        local threadId = 1734
        if subSkill2 == "CUT" then
            return findItemInInventory(uncut) ~= nil
        elseif subSkill2 == "GLASS" then
            return findItemInInventory(selectedSandstone) ~= nil
        elseif subSkill2 == "FLASKS" then
            return findItemInInventory(selectedGlass) ~= nil

        elseif subSkill2 == "ARMOR" then
            if armorType == "VAMBRACES" and armorType == "BOOTS" then
                return (findItemInInventory(selectedLeather) and findItemInInventory(threadId)) ~= nil
            elseif armorType == "CHAPS" and armorType == "COIF" then
                return HasItemMin(selectedLeather,2) and findItemInInventory(threadId) ~= nil
            elseif armorType == "BODY" then
                return HasItemMin(selectedLeather,3) and findItemInInventory(threadId) ~= nil
            elseif armorType == "SHIELD" then
                return HasItemMin(selectedLeather, 4) and findItemInInventory(threadId) ~= nil
            end
            
        end

    end
    return false
end

local function isInterfaceOpen()
    return API.Compare2874Status(18)
end

local function startCraft()
    API.KeyboardPress2(0x20, 100, 50)
end

local function isBusy()
    return API.CheckAnim(20) or API.isProcessing() or API.ReadPlayerMovin()
end
local function isBurningLogs()
    return API.CheckAnim(100) or API.isProcessing() or API.ReadPlayerMovin()
end

local function startWorking()

    if not isInterfaceOpen() then
        if selectedSkill == "COOKING" and not isBusy() then
            Interact:Object("Range", "Cook-at")
        elseif selectedSkill == "FLETCHING" and not isBusy() then
            Interact:Object("Fletching workbench", "Use")
        elseif selectedSkill == "FIREMAKING" and not isBurningLogs() then
            Interact:Object("Bonfire", "Add logs to")
        elseif selectedSkill == "CRAFTING" then
            if subSkill2 == "GLASS" and not isBusy() then
                Interact:Object("Robust glass machine", "Fill")
                API.WaitUntilMovingEnds()

            elseif subSkill2 == "FLASKS" and not isBusy() then
                API.DoAction_Inventory1(selectedGlass, 0, 1, API.OFF_ACT_GeneralInterface_route)

            elseif subSkill2 == "CUT" and not isBusy() then

                API.DoAction_Inventory1(uncut, 0, 1, API.OFF_ACT_GeneralInterface_route)
            elseif subSkill2 == "ARMOR" and not isBusy() then

                API.DoAction_Inventory1(selectedLeather, 0, 1, API.OFF_ACT_GeneralInterface_route)

            end
        end
    else
        startCraft()
    end

end

local function loadLastPreset()
    local bankIds = {125720, 125734, 92692, 125115}

    if selectedSkill == "FLETCHING" or selectedSkill == "COOKING" then
        API.logDebug("Loading last preset")
        Interact:Object("Bank chest", "Load Last Preset from")
        

    elseif selectedSkill == "FIREMAKING" then
        API.logDebug("Loading Firemaking preset")
        Interact:NPC("Banker", "Load Last Preset from")

    elseif selectedSkill == "CRAFTING" then
        API.logDebug("Loading last preset")
        if subSkill2 == "GLASS" and not isBusy() then
            Interact:Object("Bank chest", "Load Last Preset from")
        elseif (subSkill2 == "FLASKS" or subSkill2 == "CUT" or subSkill2 == "ARMOR") and not isBusy() then
            Interact:Object("Bank chest", "Load Last Preset from")

        end

    end

end

-- ==== START ====
BuildGUI()

API.logDebug(("Knetterbal AIO Skiller started with skill: %s  and sub-skill: %s and sub-skill2: %s"):format(tostring(
    selectedSkill), tostring(subSkill), tostring(subSkill2)))
API.logDebug(("Selected Fish: %s  Selected Log: %s  Selected Bow: %s  Selected Arrow: %s"):format(
    tostring(selectedFish), tostring(selectedLog), tostring(selectedBow), tostring(selectedArrow)))
API.logDebug(("BowMaterial1: %s  BowMaterial2: %s"):format(tostring(bowMaterial1), tostring(bowMaterial2)))

API.logDebug(("Selected Sandstone: %s  Selected Glass: %s"):format(tostring(selectedSandstone), tostring(selectedGlass)))

local fails = 0

while API.Read_LoopyLoop() do
    GUI.Draw()
    API.DoRandomEvents()

    if not gameStateChecks() then
        goto continue
    end

    if isStarted() then

        if not hasMaterials() then
            -- API.logDebug("Materials not found, trying to load last preset.")
            loadLastPreset()

            -- API.RandomSleep2(500, 700, 800)
            fails = fails + 1
            if fails > 5 then
                -- API.logDebug("Failed to find materials 3 times, stopping script.")
                API.Write_LoopyLoop(false)
            end
        else
            -- API.logDebug("Materials found, continuing.")
            fails = 0
            startWorking()
            API.RandomSleep2(1000, 500, 1000)
        end

    end

    ::continue::
    API.RandomSleep2(500, 700, 800)
end
