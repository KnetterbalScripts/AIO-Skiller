SM:AddTab("Skill")
SM:Dropdown("Skill:" ,"selectedSkill",{"FLETCHING","COOKING","FIREMAKING"}, "FLETCHING")

SM:AddTab("Fletching")
SM:Dropdown("Sub Skill", "subSkill", {"NONE","FLETCH", "STRING", "HEADLESS", "ARROWS"}, "NONE")
SM:Dropdown("Log Type", "logType", {"NONE","NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")
SM:Dropdown("Arrowhead Type", "arrowheadType", {"NONE","BRONZE", "IRON", "STEEL", "MITHRIL", "ADAMANT", "RUNE", "DRAGON", "BROAD"}, "NONE")
SM:Dropdown("Bow Type", "bowType", {"NONE","SHORTBOW", "LONGBOW"}, "NONE")
SM:Dropdown("unf shortbows", "bowMaterial1", {"NONE","NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")
SM:Dropdown("unf longbows", "bowMaterial2", {"NONE","NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")

SM:AddTab("Cooking")
SM:Dropdown("Fish Type", "fishType", {"NONE","SHRIMP", "ANCHOVIES", "TROUT", "SALMON", "TUNA", "SWORDFISH", "LOBSTER", "BASS", "SHARK", "MANTA_RAY", "KARAMBWAN", "KARAMBWANJI", "CAVEFISH", "ROCKTAIL", "SAILFISH"}, "NONE")

SM:AddTab("Firemaking")
SM:Dropdown("Log Type", "logType", {"NONE","NORMAL", "OAK", "WILLOW", "MAPLE", "YEW", "MAGIC"}, "NONE")

