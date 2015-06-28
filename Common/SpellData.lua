return {
    ["Aatrox"] = {
        [_Q] = { speed = 450, delay = 0.25, range = 650, width = 150, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1000, width = 150, collision = false, aoe = false, type = "linear"}
    },
    ["Ahri"] = {
        [_Q] = { speed = 1600, delay = 0.25, range = 880, width = 120, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1550, delay = 0.25, range = 900, width = 65, collision = true, aoe = false, type = "linear"}
    },
    ["Akali"] = {
        [_E] = { speed = math.huge, delay = 0.125, range = 0, width = 325, collision = false, aoe = true, type = "circular"}
    },
    ["Alistar"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 0, width = 365, collision = false, aoe = true, type = "circular"}
    },
    ["Amumu"] = {
        [_Q] = { speed = 725, delay = 0.25, range = 1000, width = 100, collision = true, aoe = false, type = "linear"}
    },
    ["Anivia"] = {
        [_Q] = { speed = 850, delay = 0.250, range = 1200, width = 110, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.100, range = 615, width = 350, collision = false, aoe = true, type = "circular"}
    },
    ["Annie"] = {
        [_W] = { speed = math.huge, delay = 0.25, range = 625, width = 250, collision = false, aoe = true, type = "cone"},
        [_R] = { speed = math.huge, delay = 0.25, range = 600, width = 300, collision = false, aoe = true, type = "circular"}
    },
    ["Ashe"] = {
        [_W] = { speed = 902, delay = 0.5, range = 1200, width = 100, collision = true, aoe = false, type = "cone"},
        [_R] = { speed = 1600, delay = 0.5, range = 25000, width = 100, collision = true, aoe = false, type = "linear"}
    },
    ["Azir"] = {
        [_Q] = { speed = 500, delay = 0.250, range = 800, width = 100, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0, range = 450, width = 100, collision = false, aoe = false, type = "circular"},
        [_R] = { speed = 1300, delay = 0.2, range = 250, width = 600, collision = false, aoe = true, type = "linear"}
    },
    ["Bard"] = {
        [_Q] = { speed = 1100, delay = 0.25, range = 850, width = 108, collision = true, aoe = false, type = "linear"}
    },
    ["Blitzcrank"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 900, width = 70, collision = true, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 500, collision = false, aoe = false, type = "circular"}
    },
    ["Brand"] = {
        [_Q] = { speed = 1200, delay = 0.5, range = 1050, width = 80, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = 900, delay = 0.25, range = 1050, width = 275, collision = false, aoe = false, type = "linear"}
    },
    ["Braum"] = {
        [_Q] = { speed = 1600, delay = 225, range = 1000, width = 100, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 1250, delay = 500, range = 1250, width = 0, collision = false, aoe = false, type = "linear"}
    },
    ["Caitlyn"] = {
        [_Q] = { speed = 2200, delay = 0.625, range = 1300, width = 0, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 2000, delay = 0.400, range = 1000, width = 80, collision = false, aoe = false, type = "linear"}
    },
    ["Cassiopeia"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 850, width = 100, collision = false, aoe = true, type = "circular"},
        [_W] = { speed = math.huge, delay = 0.5, range = 925, width = 90, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.5, range = 825, width = 410, collision = false, aoe = true, type = "cone"}
    },
    ["Chogath"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 950, width = 300, collision = false, aoe = true, type = "circular"},
        [_W] = { speed = math.huge, delay = 0.5, range = 650, width = 275, collision = false, aoe = false, type = "linear"},
    },
    ["Corki"] = {
        [_Q] = { speed = 700, delay = 0.4, range = 825, width = 250, collision = false, aoe = false, type = "circular"},
        [_R] = { speed = 2000, delay = 0.200, range = 1225, width = 60, collision = false, aoe = false, type = "linear"},
    },
    ["Darius"] = {
        [_E] = { speed = 1500, delay = 0.550, range = 530, width = 0, collision = false, aoe = true, type = "cone"}
    },
    ["Diana"] = {
        [_Q] = { speed = 2000, delay = 0.250, range = 830, width = 0, collision = false, aoe = false, type = "linear"}
    },
    ["DrMundo"] = {
        [_Q] = { speed = 2000, delay = 0.250, range = 1050, width = 75, collision = true, aoe = false, type = "linear"}
    },
    ["Draven"] = {
        [_E] = { speed = 1400, delay = 0.250, range = 1100, width = 130, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 2000, delay = 0.5, range = 25000, width = 160, collision = false, aoe = false, type = "linear"}
    },
    ["Ekko"] = {
        [_Q] = { speed = 1050, delay = 0.25, range = 925, width = 140, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 3, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.5, range = 0, width = 400, collision = false, aoe = true, type = "circular"}
    },
    ["Elise"] = {
        [_E] = { speed = 1450, delay = 0.250, range = 975, width = 70, collision = true, aoe = false, type = "linear"}
    },
    ["Evelynn"] = {
        [_Q] = { speed = 1300, delay = 0.250, range = 650, width = 350, collision = false, aoe = true, type = "circular" }
    },
    ["Ezreal"] = {
        [_Q] = { speed = 2000, delay = 0.25, range = 1200, width = 65, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1200, delay = 0.25, range = 900, width = 90, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 2000, delay = 1, range = 25000, width = 180, collision = false, aoe = false, type = "linear"}
    },
    ["Fizz"] = {
        [_R] = { speed = 1350, delay = 0.250, range = 1150, width = 100, collision = false, aoe = false, type = "linear"}
    },
    ["Galio"] = {
        [_Q] = { speed = 1300, delay = 0.25, range = 900, width = 250, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1000, width = 200, collision = false, aoe = false, type = "linear"}
    },
    ["Gangplank"] = {
        [_R] = { speed = math.huge, delay = 0.25, range = 25000, width = 575, collision = false, aoe = true, type = "circular"}
    },
    ["Gnar"] = {
        [_Q] = { speed = 1225, delay = 0.125, range = 1200, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["Gragas"] = {
        [_Q] = { speed = 1000, delay = 0.250, range = 1000, width = 300, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = math.huge, delay = 0.250, range = 600, width = 50, collision = true, aoe = true, type = "circular"},
        [_R] = { speed = 1000, delay = 0.250, range = 1050, width = 400, collision = false, aoe = true, type = "circular"}
    },
    ["Graves"] = {
        [_Q] = { speed = 1950, delay = 0.265, range = 750, width = 85, collision = false, aoe = false, type = "cone"},
        [_W] = { speed = 1650, delay = 0.300, range = 700, width = 250, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 2100, delay = 0.219, range = 1000, width = 100, collision = false, aoe = false, type = "linear"}
    },
    ["Hecarim"] = {
        [_Q] = { speed = math.huge, delay = 0.250, range = 0, width = 350, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1900, delay = 0.219, range = 1000, width = 200, collision = false, aoe = false, type = "linear"}
    },
    ["Heimerdinger"] = {
        [_W] = { speed = 900, delay = 0.500, range = 1325, width = 100, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 2500, delay = 0.250, range = 970, width = 180, collision = false, aoe = true, type = "circular"}
    },
    ["Irelia"] = {
        [_R] = { speed = 1700, delay = 0.250, range = 1200, width = 25, collision = false, aoe = false, type = "linear"}
    },
    ["Janna"] = {
        [_Q] = { speed = 1500, delay = 0.250, range = 1700, width = 150, collision = false, aoe = false, type = "linear"}
    },
    ["JarvanIV"] = {
        [_Q] = { speed = 1400, delay = 0.2, range = 770, width = 0, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 200, delay = 0.2, range = 850, width = 0, collision = false, aoe = false, type = "linear"}
    },
    ["Jaycve"] = {
        [_Q] = { speed = 2350, delay = 0.15, range = 1750, width = 70, collision = true, aoe = false, type = "linear"}
    },
    ["Jax"] = {
        [_E] = { speed = math.huge, delay = 0.250, range = 0, width = 375, collision = false, aoe = true, type = "circular"}
    },
    ["Jinx"] = {
        [_W] = { speed = 3000, delay = 0.600, range = 1400, width = 60, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 887, delay = 0.500, range = 830, width = 0, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1700, delay = 0.600, range = 20000, width = 120, collision = false, aoe = true, type = "circular"}
    },
    ["Kalista"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1375, width = 70, collision = true, aoe = false, type = "linear"},
    },
    ["Karma"] = {
        [_Q] = { speed = 1700, delay = 0.250, range = 950, width = 90, collision = true, aoe = false, type = "linear"}
    },
    ["Karthus"] = {
        [_Q] = { speed = math.huge, delay = 0.75, range = 825, width = 120, collision = false, aoe = true, type = "circular"}
    },
    ["Kassadin"] = {
        [_E] = { speed = 2200, delay = 0, range = 650, width = 80, collision = false, aoe = false, type = "cone"},
        [_R] = { speed = math.huge, delay = 0.5, range = 500, width = 150, collision = false, aoe = true, type = "circular"}
    },
    ["Kennen"] = {
        [_Q] = { speed = 1700, delay = 0.180, range = 1050, width = 70, collision = true, aoe = false, type = "linear"}
    },
    ["KhaZix"] = {
        [_W] = { speed = 1700, delay = 0.25, range = 1025, width = 70, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 400, delay = 0.25, range = 600, width = 325, collision = false, aoe = true, type = "circular"}
    },
    ["KogMaw"] = {
        [_Q] = { speed = 1725, delay = 0.125, range = 975, width = 80, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 1200, delay = 0.25, range = 1200, width = 120, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.65, range = 2200, width = 250, collision = false, aoe = true, type = "circular"}
    },
    ["LeBlanc"] = {
        [_E] = { speed = 1600, delay = 0.250, range = 960, width = 70, collision = true, aoe = false, type = "linear"}
    },
    ["LeeSin"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1000, width = 70, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = math.huge, delay = 0.25, range = 0, width = 450, collision = false, aoe = false, type = "circular"},
        [_R] = { speed = 2000, delay = 0.25, range = 2000, width = 150, collision = false, aoe = false, type = "linear"}
    },
    ["Leona"] = {
        [_E] = { speed = 2000, delay = 0.250, range = 875, width = 80, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 2000, delay = 0.250, range = 1200, width = 300, collision = false, aoe = true, type = "circular"}
    },
    ["Lissandra"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 725, width = 20, collision = true, aoe = false, type = "linear"}
    },
    ["Lucian"] = {
        [_W] = { speed = 800, delay = 0.300, range = 1000, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["Lulu"] = {
        [_Q] = { speed = 1400, delay = 0.250, range = 925, width = 80, collision = false, aoe = false, type = "linear"}
    },
    ["Lux"] = {
        [_Q] = { speed = 1350, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear" },
        [_W] = { speed = 1630, delay = 0.25, range = 1250, width = 210, collision = false, type = "linear" },
        [_E] = { speed = 1275, delay = 0.25, range = 1100, width = 250, collision = false, type = "circular" },
        [_R] = { speed = math.huge, delay = 1, range = 3340, width = 250, collision = false, type = "linear" }
    },
    ["Malphite"] = {
        [_R] = { speed = 1600, delay = 0.5, range = 900, width = 500, collision = false, aoe = true, type = "circular"}
    },
    ["Malzahar"] = {
        [_Q] = { speed = math.huge, delay = 0.5, range = 900, width = 100, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.5, range = 800, width = 250, collision = false, aoe = false, type = "circular"}
    },
    ["Maokai"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 600, width = 100, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1500, delay = 0.25, range = 1100, width = 175, collision = false, aoe = false, type = "circular"}
    },
    ["MissFortune"] = {
        [_E] = { speed = math.huge, delay = 0.25, range = 800, width = 200, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.25, range = 1400, width = 700, collision = false, aoe = true, type = "cone"}
    },
    ["Mordekaiser"] = {
        [_E] = { speed = math.huge, delay = 0.25, range = 700, width = 0, collision = false, aoe = true, type = "cone"}
    },
    ["Morgana"] = {
        [_Q] = { speed = 1200, delay = 0.250, range = 1300, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["Nami"] = {
        [_Q] = { speed = math.huge, delay = 0.8, range = 850, width = 0, collision = false, aoe = true, type = "circular"}
    },
    ["Nasus"] = {
        [_E] = { speed = math.huge, delay = 0.25, range = 450, width = 250, collision = false, aoe = true, type = "circular"}
    },
    ["Nautilus"] = {
        [_Q] = { speed = 2000, delay = 0.250, range = 1080, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["Nidalee"] = {
        [_Q] = { speed = 1325, delay = 0.25, range = 1625, width = 37.5, collision = true, type = "linear"}
    },
    ["Nocturne"] = {
        [_Q] = { speed = 1400, delay = 0.250, range = 1125, width = 60, collision = false, aoe = false, type = "linear"}
    },
    ["Olaf"] = {
        [_Q] = { speed = 1600, delay = 0.25, range = 1000, width = 90, collision = false, aoe = false, type = "linear"}
    },
    ["Orianna"] = {
        [_Q] = { speed = 1200, delay = 0.250, range = 825, width = 175, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1800, delay = 0.250, range = 825, width = 80, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.250, range = 0, width = 410, collision = false, aoe = true, type = "circular"}
    },
    ["Pantheon"] = {
        [_E] = { speed = math.huge, delay = 0.250, range = 400, width = 100, collision = false, aoe = true, type = "cone"},
        [_R] = { speed = 3000, delay = 1, range = 5500, width = 1000, collision = false, aoe = true, type = "circular"}
    },
    ["Quinn"] = {
        [_Q] = { speed = 1550, delay = 0.25, range = 1050, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["RekSai"] = {
        [_Q] = { speed = 1550, delay = 0.25, range = 1050, width = 180, collision = true, aoe = false, type = "linear"}
    },
    ["Renekton"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 0, width = 450, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1225, delay = 0.25, range = 450, width = 150, collision = false, aoe = false, type = "linear"}
    },
    ["Rengar"] = {
        [_W] = { speed = math.huge, delay = 0.5, range = 0, width = 490, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 825, delay = 0.50, range = 1000, width = 80, collision = true, aoe = false, type = "linear"}
    },
    ["Riven"] = {
        [_Q] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular"},
        [_W] = { speed = math.huge, delay = 0.250, range = 0, width = 250, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 2200, delay = 0.5, range = 1100, width = 200, collision = false, aoe = false, type = "cone"}
    },
    ["Rumble"] = {
        [_Q] = { speed = math.huge, delay = 0.250, range = 600, width = 500, collision = false, aoe = false, type = "cone"},
        [_E] = { speed = 1200, delay = 0.250, range = 850, width = 90, collision = true, aoe = false, type = "linear"},
        [_R] = { speed = 1200, delay = 0.250, range = 1700, width = 90, collision = false, aoe = false, type = "linear"}
    },
    ["Ryze"] = {
        [_Q] = { speed = 1875, delay = 0.25, range = 900, width = 55, collision = true, aoe = false, type = "linear"},
    },
    ["Sejuani"] = {
        [_R] = { speed = 1600, delay = 0.250, range = 1200, width = 110, collision = false, aoe = false, type = "linear"}
    },
    ["Shen"] = {
        [_E] = { speed = 1200, delay = 0.25, range = 600, width = 40, collision = false, aoe = false, type = "linear"}
    },
    ["Shyvana"] = {
        [_E] = { speed = 1500, delay = 0.250, range = 925, width = 60, collision = false, aoe = false, type = "linear"}
    },
    ["Sion"] = {
        [_Q] = { speed = math.huge, delay = 0.125, range = 925, width = 250, collision = false, aoe = false, type = "cone"}
    },
    ["Sivir"] = {
        [_Q] = { speed = 1330, delay = 0.250, range = 1075, width = 0, collision = false, aoe = false, type = "linear"}
    },
    ["Skarner"] = {
        [_E] = { speed = 1200, delay = 0.600, range = 350, width = 60, collision = false, aoe = false, type = "linear"}
    },
    ["Sona"] = {
        [_R] = { speed = 2400, delay = 0.5, range = 900, width = 160, collision = false, aoe = false, type = "linear"}
    },
    ["Soraka"] = {
        [_R] = { speed = 2400, delay = 0.25, range = 900, width = 160, collision = false, aoe = true, type = "circular"}
    },
    ["Swain"] = {
        [_W] = { speed = math.huge, delay = 0.850, range = 900, width = 125, collision = false, aoe = true, type = "circular"}
    },
    ["Syndra"] = {
        [_Q] = { speed = math.huge, delay = 0.600, range = 790, width = 125, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 2500, delay = 0.250, range = 700, width = 45, collision = false, aoe = true, type = "cone"}
    },
    ["Talon"] = {
        [_W] = { speed = 900, delay = 0.7, range = 600, width = 200, collision = false, aoe = false, type = "cone"}
    },
    ["Taric"] = {
        [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 175, collision = false, aoe = false, type = "circular"}
    },
    ["Thresh"] = {
        [_Q] = { speed = 1825, delay = 0.25, range = 1050, width = 70, collision = true, aoe = false, type = "linear"}
    },
    ["Tristana"] = {
        [_Q] = { speed = 2100, delay = 0.25, range = 900, width = 125, collision = false, aoe = false, type = "circular"}
    },
    ["Trundle"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 1000, width = 125, collision = false, aoe = false, type = "circular"}
    },
    ["Tryndamere"] = {
        [_E] = { speed = 700, delay = 0.250, range = 650, width = 160, collision = false, aoe = false, type = "linear"}
    },
    ["TwistedFate"] = {
        [_Q] = { speed = 1500, delay = 0.250, range = 1200, width = 80, collision = false, aoe = false, type = "cone"}
    },
    ["Twitch"] = {
        [_W] = {speed = 1750, delay = 0.250, range = 950, width = 275, collision = false, aoe = true, type = "circular"}
    },
    ["Urgot"] = {
        [_Q] = { speed = 1600, delay = 0.2, range = 1400, width = 80, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 1750, delay = 0.3, range = 920, width = 200, collision = false, aoe = true, type = "circular"}
    },
    ["Varus"] = {
        [_Q] = { speed = 1500, delay = 0.5, range = 1475, width = 100, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1750, delay = 0.25, range = 925, width = 235, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1200, delay = 0.5, range = 800, width = 100, collision = false, aoe = false, type = "linear"}
    },
    ["Vayne"] = {
        [_E] = { speed = 2200, delay = 0.25, range = 1000, width = 0, collision = false, aoe = false, type = "linear"}
    },
    ["Veigar"] = {
        [_Q] = { speed = 1200, delay = 0.25, range = 875, width = 75, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 900, delay = 1.25, range = 900, width = 110, collision = false, aoe = true, type = "circular"}
    },
    ["VelKoz"] = {
        [_Q] = { speed = 1300, delay = 0.066, range = 1050, width = 50, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1700, delay = 0.064, range = 1050, width = 80, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1500, delay = 0.333, range = 850, width = 225, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.333, range = 1550, width = 50, collision = false, aoe = false, type = "linear"}
    },
    ["Vi"] = {
        [_Q] = { speed = 1500, delay = 0.25, range = 715, width = 55, collision = false, aoe = false, type = "linear"}
    },
    ["Viktor"] = {
        [_W] = { speed = 750, delay = 0.6, range = 700, width = 125, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1200, width = 0, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 1000, delay = 0.25, range = 700, width = 0, collision = false, aoe = true, type = "circular"}
    },
    ["Xerath"] = {
        [_Q] = { speed = math.huge, delay = 1.75, range = 750, width = 100, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.25, range = 1100, width = 100, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1600, delay = 0.25, range = 1050, width = 70, collision = true, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.75, range = 3200, width = 245, collision = false, aoe = true, type = "circular"}
    },
    ["XinZhao"] = {
        [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 375, collision = false, aoe = true, type = "circular"}
    },
    ["Yasuo"] = {
        [_Q] =  { speed = math.huge, delay = 250, range = 475, width = 40, collision = false, aoe = false, type = "linear"}
    },
    ["Yorick"] = {
        [_W] = { speed = math.huge, delay = 0.25, range = 600, width = 175, collision = false, aoe = true, type = "circular"}
    },
    ["Zac"] = {
        [_Q] = { speed = 2500, delay = 0.110, range = 500, width = 110, collision = false, aoe = false, type = "linear"}
    },
    ["Zed"] = {
        [_Q] = { speed = 1700, delay = 0.25, range = 900, width = 48, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = math.huge, delay = 0, range = 0, width = 300, collision = false, aoe = true, type = "circular"}
    },
    ["Ziggs"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1400, width = 155, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1800, delay = 0.25, range = 970, width = 275, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1750, delay = 0.12, range = 900, width = 350, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1750, delay = 0.14, range = 5300, width = 525, collision = false, aoe = true, type = "circular"}
    },
    ["Zilean"] = {
        [_Q] = { speed = math.huge, delay = 0.5, range = 900, width = 150, collision = false, aoe = true, type = "circular"}
    },
    ["Zyra"] = {
        [_Q] = { speed = math.huge, delay = 0.7, range = 800, width = 85, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1150, delay = 0.25, range = 1100, width = 70, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 1, range = 1100, width = 500, collision=false, aoe = true, type = "circular"}
    }
}
