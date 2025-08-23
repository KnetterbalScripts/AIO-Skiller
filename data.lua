local DATA = {}

DATA.BANK = {
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

DATA.SANDSTONE = {
    RED = 23194,
    CRYSTAL = 32847
}

DATA.GLASS = {
    ROBUST = 23193,
    CRYSTAL = 32845
}

DATA.LEATHER = {
    LEATHER = 1741,
    HARDLEATHER = 1743,
    SPIDERSILK = 25547,
    GREEN = 1745,
    BLUE = 2505,
    RED = 2507,
    BLACK = 2509,
    ROYAL = 24374,
    DINO = 48025,
    UNDEAD = 56075
}
DATA.FISH = {
    SHRIMP = 317,
    CRAYFISH = 13435,
    SARDINE = 327,
    HERRING = 345,
    ANCHOVIES = 321,
    MACKEREL = 353,
    TROUT = 335,
    COD = 341,
    PIKE = 349,
    SALMON = 331,
    SLIMY_EEL = 3379,
    RAINBOW_FISH = 10138,
    TUNA = 359,
    KARAMBWAN = 3142,
    CAVE_EEL = 5001,
    LOBSTER = 377,
    BASS = 363,
    SWORDFISH = 371,
    MONKFISH = 7944,
    DESERT_SOLE = 40287,
    CATFISH = 40289,
    BELTFISH = 40291,
    SHARK = 383,
    SEA_TURTLE = 395,
    MANTA_RAY = 389,
    GREAT_WHITE_SHARK = 34727,
    CAVEFISH = 15264,
    ROCKTAIL = 15270,
    TIGER_SHARK = 21520,
    SAILFISH = 42249
}
DATA.UNCUTGEMS = {
    SAPPHIRE = 1623,
    EMERALD = 1621,
    RUBY = 1619,
    DIAMOND = 1617,
    DRAGONSTONE = 1631,
    OPAL = 1625,
    JADE = 1627,
    TOPAZ = 1629
}

DATA.CUTGEMS = {
    SAPPHIRE = 1607,
    EMERALD = 1605,
    RUBY = 1603,
    DIAMOND = 1601,
    DRAGONSTONE = 1615,
    OPAL = 1609,
    JADE = 1611,
    TOPAZ = 1613,
    ENCHANTED_GEM = 4155
}
DATA.ARROWHEADS = {
    BRONZE = 39,
    IRON = 40,
    STEEL = 41,
    MITHRIL = 42,
    ADAMANT = 43,
    RUNE = 44,
    DRAGON = 11237,
    BROAD = 13278

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

DATA.ENERGY = {
    VIBRANT = 29319,
    RADIANT = 29322,
    LUMINOUS = 29323,
    INCANDESCENT = 29324
}

DATA.NECKLACE = {
    EMERALD = 1658,
    RUBY = 1660,
    DIAMOND = 1662,
    DRAGONSTONE = 1664
}

-- Config data and material data resolve
local function clean(s)
    if type(s) ~= "string" then
        return nil
    end
    s = s:gsub("%s+", "_"):upper()
    if s == "" or s == "NONE" then
        return nil
    end
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
    local selectedArrow = clean(cfg.arrowheadType)
    local bowMaterial1 = clean(cfg.bowMaterial1)
    local bowMaterial2 = clean(cfg.bowMaterial2)
    local subSkill2 = clean(cfg.subSkill2)
    local uncut = clean(cfg.uncut)
    local selectedSandstone = clean(cfg.selectedSandstone)
    local selectedGlass = clean(cfg.selectedGlass)
    local selectedLeather = clean(cfg.selectedLeather)
    local armorType = clean(cfg.armorType)
    local EnergyType = clean(cfg.EnergyType)
    local necklaceType = clean(cfg.necklaceType)
    local porterType = clean(cfg.porterType)

    local out = {
        selectedSkill = selectedSkill,
        subSkill = subSkill,
        selectedFish = selectedFish and DATA.FISH[selectedFish] or nil,
        selectedLog = selectedLog and DATA.LOGS[selectedLog] or nil,
        selectedArrow = selectedArrow and DATA.ARROWHEADS[selectedArrow] or nil,
        bowMaterial1 = bowMaterial1 and DATA.SHORTBOW[bowMaterial1] or nil,
        bowMaterial2 = bowMaterial2 and DATA.SHIELDBOW[bowMaterial2] or nil,
        subSkill2 = subSkill2,
        uncut = uncut and DATA.UNCUTGEMS[uncut] or nil,
        selectedSandstone = selectedSandstone and DATA.SANDSTONE[selectedSandstone] or nil,
        selectedGlass = selectedGlass and DATA.GLASS[selectedGlass] or nil,
        selectedLeather = selectedLeather and DATA.LEATHER[selectedLeather] or nil,
        armorType = armorType,
        EnergyType = EnergyType and DATA.ENERGY[EnergyType] or nil,
        necklaceType = necklaceType and DATA.NECKLACE[necklaceType] or nil,
        porterType = porterType
    }

    return out
end

return DATA
