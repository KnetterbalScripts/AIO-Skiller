<<<<<<< HEAD
local DATA = {}

DATA.BANK = 
{
    FLETCHING = 125720,

    COOKING = 125734
}
DATA.STATION = {
    FLETCHING = 125718,
    
    COOKING = 125205,

    FIREMAKING = 92885,

    GLASSMAKING = 94067
}

DATA.LOGS = {
    NORMAL = 1511,
    OAK = 1521,
    WILLOW = 1519,
    MAPLE = 1517,
    YEW = 1515,
    MAGIC = 1513,
    SHAFTS = 52
}

DATA.FISH = {
    SHRIMP = 317,
    ANCHOVIES = 321,
    TROUT = 335,
    SALMON = 331,
    TUNA = 359,
    SWORDFISH = 371,
    LOBSTER = 377,
    BASS = 363,
    SHARK = 383,
    MANTA_RAY = 389,
    KARAMBWAN = 3142,
    KARAMBWANJI = 3153,
    CAVEFISH = 15264,
    ROCKTAIL = 15270,
    SAILFISH = 42249
}
DATA.UNCUTGEMS = {}

DATA.CUTGEMS = {
    SAPPHIRE = 1607,
    EMERALD = 1605,
    RUBY = 1603,
    DIAMOND = 1601,
    DRAGONSTONE = 1615,
    OPAL = 1609,
    JADE = 1611,
    TOPAZ = 1613,
    ENCHANTED_GEM = 4155,
}
DATA.ARROWHEADS = {
    BRONZE = 39,
    IRON = 40,
    STEEL = 41,
    MITHRIL = 42,
    ADAMANT = 43,
    RUNE = 44,
    DRAGON = 11237,
    BROAD = 13278,

}
DATA.SHORTBOW = {
    NORMAL = 52,
    OAK = 55,
    WILLOW = 61,
    MAPLE = 63,
    YEW = 68,
    MAGIC = 72
}
DATA.SHIELDBOW = {
    NORMAL = 49,
    OAK = 57,
    WILLOW = 59,
    MAPLE = 65,
    YEW = 67,
    MAGIC = 71
}



-- === Simpele config-resolver direct in DATA ===
local function clean(s)
    if type(s) ~= "string" then return nil end
    s = s:gsub("%s+", "_"):upper()
    if s == "" or s == "NONE" then return nil end
    return s
end

function DATA.resolve(cfg)
    if not cfg then
        pcall(require, "Knetter AIO Skiller.config")
        cfg = rawget(_G, "CONFIG") or {}
    end

    local selectedSkill = clean(cfg.selectedSkill) or "FLETCHING"
    local subSkill = clean(cfg.subSkill)
    local selectedFish = clean(cfg.fishType)
    local selectedLog = clean(cfg.logType)
    local bowStyle = clean(cfg.bowType)
    local selectedArrow = clean(cfg.arrowheadType)
    local bowMaterial1 = clean(cfg.bowMaterial1)

    local out = {
        selectedSkill = selectedSkill,
        subSkill = subSkill,
        selectedFish = selectedFish and DATA.FISH[selectedFish] or nil,
        selectedLog = selectedLog and DATA.LOGS[selectedLog] or nil,
        bowStyle = bowStyle,
        selectedArrow = selectedArrow and DATA.ARROWHEADS[selectedArrow] or nil
    }

    if bowStyle and bowMaterial1 and DATA[bowStyle] and DATA[bowStyle][bowMaterial1] then
        out.selectedBow = DATA[bowStyle][bowMaterial1]
    else
        out.selectedBow = nil
    end

    return out
end

=======
local DATA = {}

DATA.BANK = 
{
    FLETCHING = 125720,

    COOKING = 125734
}
DATA.STATION = {
    FLETCHING = 125718,
    
    COOKING = 125205,

    FIREMAKING = 92885,

    GLASSMAKING = 94067
}

DATA.LOGS = {
    NORMAL = 1511,
    OAK = 1521,
    WILLOW = 1519,
    MAPLE = 1517,
    YEW = 1515,
    MAGIC = 1513,
    SHAFTS = 52
}

DATA.FISH = {
    SHRIMP = 317,
    ANCHOVIES = 321,
    TROUT = 335,
    SALMON = 331,
    TUNA = 359,
    SWORDFISH = 371,
    LOBSTER = 377,
    BASS = 363,
    SHARK = 383,
    MANTA_RAY = 389,
    KARAMBWAN = 3142,
    KARAMBWANJI = 3153,
    CAVEFISH = 15264,
    ROCKTAIL = 15270,
    SAILFISH = 42249
}
DATA.UNCUTGEMS = {}

DATA.CUTGEMS = {
    SAPPHIRE = 1607,
    EMERALD = 1605,
    RUBY = 1603,
    DIAMOND = 1601,
    DRAGONSTONE = 1615,
    OPAL = 1609,
    JADE = 1611,
    TOPAZ = 1613,
    ENCHANTED_GEM = 4155,
}
DATA.ARROWHEADS = {
    BRONZE = 39,
    IRON = 40,
    STEEL = 41,
    MITHRIL = 42,
    ADAMANT = 43,
    RUNE = 44,
    DRAGON = 11237,
    BROAD = 13278,

}
DATA.SHORTBOW = {
    NORMAL = 52,
    OAK = 55,
    WILLOW = 61,
    MAPLE = 63,
    YEW = 68,
    MAGIC = 72
}
DATA.SHIELDBOW = {
    NORMAL = 49,
    OAK = 57,
    WILLOW = 59,
    MAPLE = 65,
    YEW = 67,
    MAGIC = 71
}



-- === Simpele config-resolver direct in DATA ===
local function clean(s)
    if type(s) ~= "string" then return nil end
    s = s:gsub("%s+", "_"):upper()
    if s == "" or s == "NONE" then return nil end
    return s
end

function DATA.resolve(cfg)
    if not cfg then
        pcall(require, "Knetter AIO Skiller.config")
        cfg = rawget(_G, "CONFIG") or {}
    end

    local selectedSkill = clean(cfg.selectedSkill) or "FLETCHING"
    local subSkill = clean(cfg.subSkill)
    local selectedFish = clean(cfg.fishType)
    local selectedLog = clean(cfg.logType)
    local bowStyle = clean(cfg.bowType)
    local selectedArrow = clean(cfg.arrowheadType)
    local bowMaterial1 = clean(cfg.bowMaterial1)

    local out = {
        selectedSkill = selectedSkill,
        subSkill = subSkill,
        selectedFish = selectedFish and DATA.FISH[selectedFish] or nil,
        selectedLog = selectedLog and DATA.LOGS[selectedLog] or nil,
        bowStyle = bowStyle,
        selectedArrow = selectedArrow and DATA.ARROWHEADS[selectedArrow] or nil
    }

    if bowStyle and bowMaterial1 and DATA[bowStyle] and DATA[bowStyle][bowMaterial1] then
        out.selectedBow = DATA[bowStyle][bowMaterial1]
    else
        out.selectedBow = nil
    end

    return out
end

>>>>>>> 3714bb59b834c62544d3d7b949349b2698273340
return DATA