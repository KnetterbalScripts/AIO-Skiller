


-- Main skill tab
SM:AddTab("Skill")
SM:Dropdown("Skill:", "selectedSkill", {"FLETCHING", "COOKING", "FIREMAKING"}, "FLETCHING")

-- Fletching tab 
SM:AddTab("Fletching")
SM:Dropdown("Sub Skill", "subSkill", {"NONE", "FLETCH", "STRING", "HEADLESS", "ARROWS"}, "NONE")
SM:Dropdown("Log Type", "logType", {"NONE", "NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")
SM:Dropdown("Arrowhead Type", "arrowheadType", {"NONE", "BRONZE", "IRON", "STEEL", "MITHRIL", "ADAMANT", "RUNE", "DRAGON", "BROAD"}, "NONE")
SM:Dropdown("unf shortbows", "bowMaterial1", {"NONE", "NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")
SM:Dropdown("unf longbows", "bowMaterial2", {"NONE", "NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")

-- Cooking tab
SM:AddTab("Cooking")
SM:Dropdown("Fish Type", "fishType", {"NONE", "SHRIMP", "CRAYFISH", "SARDINE", "HERRING", "ANCHOVIES", "MACKEREL", "TROUT", "COD", "PIKE", "SALMON", "SLIMY_EEL", "RAINBOW_FISH", "TUNA", "KARAMBWAN", "CAVE_EEL", "LOBSTER", "BASS", "SWORDFISH", "MONKFISH", "DESERT_SOLE", "CATFISH", "BELTFISH", "SHARK", "SEA_TURTLE", "MANTA_RAY", "GREAT_WHITE_SHARK", "CAVEFISH", "ROCKTAIL", "TIGER_SHARK", "SAILFISH"}, "NONE")

-- Firemaking tab
SM:AddTab("Firemaking")
SM:Dropdown("Log Type", "logType", {"NONE", "NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")

