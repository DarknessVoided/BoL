--[[

             _               _               _   
     /\     (_)             | |             | |  
    /  \     _   _ __ ___   | |__     ___   | |_ 
   / /\ \   | | | '_ ` _ \  | '_ \   / _ \  | __|
  / ____ \  | | | | | | | | | |_) | | (_) | | |_ 
 /_/    \_\ |_| |_| |_| |_| |_.__/   \___/   \__|
                                          
                                                 
]]--

if not VIP_USER then return end -- VIP only since we use packets

--[[ Skillshot list start ]]--
_G.Champs = {
    ["Aatrox"] = {
        [_Q] = { speed = 450, delay = 0.25, range = 650, width = 150, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1000, width = 150, collision = false, aoe = false, type = "linear"}
    },
        ["Ahri"] = {
        [_Q] = { speed = 1200, delay = 0.25, range = 880, width = 100, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1100, delay = 0.25, range = 975, width = 60, collision = true, aoe = false, type = "linear"}
    },
        ["Amumu"] = {
        [_Q] = { speed = 2000, delay = 0.250, range = 1100, width = 80, collision = true, aoe = false, type = "linear"}
    },
        ["Anivia"] = {
        [_Q] = { speed = 850, delay = 0.250, range = 1200, width = 110, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 0.100, range = 615, width = 350, collision = false, aoe = true, type = "circular"}
    },
        ["Annie"] = {
        [_W] = { speed = math.huge, delay = 0.25, range = 625, width = 0, collision = false, aoe = true, type = "cone"},
        [_R] = { speed = math.huge, delay = 0.1, range = 600, width = 300, collision = false, aoe = true, type = "circular"}
    },
        ["Ashe"] = {
        [_W] = { speed = 2000, delay = 0.120, range = 1200, width = 85, collision = true, aoe = false, type = "cone"},
        [_R] = { speed = 1600, delay = 0.25, range = 25000, width = 120, collision = false, aoe = false, type = "linear"}
    },
        ["Blitzcrank"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 900, width = 70, collision = true, aoe = false, type = "linear"}
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
        [_Q] = { speed = math.huge, delay = 0.535, range = 850, width = 130, collision = false, aoe = false, type = "circular"},
        [_W] = { speed = math.huge, delay = 0.350, range = 850, width = 212, collision = false, aoe = false, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.535, range = 850, width = 350, collision = false, aoe = false, type = "cone"}
    },
        ["Chogath"] = {
        [_Q] = { speed = math.huge, delay = 0.625, range = 950, width = 300, collision = false, aoe = true, type = "circular"},
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
        ["Elise"] = {
        [_E] = { speed = 1450, delay = 0.250, range = 975, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["Ezreal"] = {
        [_Q] = { speed = 1975, delay = 0.25, range = 1200, width = 80, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1600, delay = 0.25, range = 900, width = 100, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 2000, delay = 1, range = 20000, width = 160, collision = false, aoe = false, type = "linear"}
    },
        ["Fizz"] = {
        [_R] = { speed = 1350, delay = 0.250, range = 1150, width = 100, collision = false, aoe = false, type = "linear"}
    },
        ["Galio"] = {
        [_Q] = { speed = 1300, delay = 0.25, range = 900, width = 250, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1000, width = 200, collision = false, aoe = false, type = "linear"}
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
        ["Heimerdinger"] = {
        [_W] = { speed = 900, delay = 0.500, range = 1325, width = 100, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 2500, delay = 0.250, range = 970, width = 180, collision = false, aoe = true, type = "circular"}
    },
        ["Irelia"] = {
        [_R] = { speed = 1700, delay = 0.250, range = 1200, width = 10, collision = false, aoe = false, type = "linear"}
    },
        ["JarvanIV"] = {
        [_Q] = { speed = 1400, delay = 0.2, range = 770, width = 0, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 200, delay = 0.2, range = 850, width = 0, collision = false, aoe = false, type = "linear"}
    },
        ["Jinx"] = {
        [_W] = { speed = 3000, delay = 0.600, range = 1400, width = 60, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 887, delay = 0.500, range = 830, width = 0, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1700, delay = 0.600, range = 20000, width = 120, collision = false, aoe = true, type = "circular"}
    },
        ["Jayce"] = {
        [_Q] = { speed = 2350, delay = 0.15, range = 1750, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["Kalista"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1450, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["Karma"] = {
        [_Q] = { speed = 1700, delay = 0.250, range = 950, width = 90, collision = true, aoe = false, type = "linear"}
    },
        ["Karthus"] = {
        [_Q] = { speed = 1700, delay = 0.25, range = 875, width = 140, collision = false, aoe = true, type = "circular"}
    },
        ["Kennen"] = {
        [_Q] = { speed = 1700, delay = 0.180, range = 1050, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["Khazix"] = {
        [_W] = { speed = 1700, delay = 0.25, range = 1025, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["KogMaw"] = {
        [_Q] = { speed = 1550, delay = 0.3667, range = 975, width = 60, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 1200, delay = 0.5, range = 1200, width = 120, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 1.1, range = 2200, width = 65, collision = false, aoe = true, type = "circular"}
    },
        ["Leblanc"] = {
        [_E] = { speed = 1600, delay = 0.250, range = 960, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["LeeSin"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 1100, width = 100, collision = true, aoe = false, type = "linear"}
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
        [_Q] = { speed = 1200, delay = 0.25, range = 1175, width = 80, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 1300, delay = 0.25, range = 1100, width = 275, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.25, range = 3340, width = 190, collision = false, aoe = false, type = "linear"},
    },
        ["Malphite"] = {
        [_R] = { speed = 550, delay = 0.0, range = 1000, width = 300, collision = false, aoe = true, type = "circular"}
    },
        ["Malzahar"] = {
        [_Q] = { speed = 1600, delay = 0.600, range = 900, width = 200, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.25, range = 800, width = 240, collision = false, aoe = true, type = "circular"}
    },
        ["Mordekaiser"] = {
        [_E] = { speed = math.huge, delay = 0.25, range = 700, width = 0, collision = false, aoe = true, type = "cone"},
    },
        ["Morgana"] = {
        [_Q] = { speed = 1200, delay = 0.250, range = 1300, width = 80, collision = true, aoe = false, type = "linear"}
    },
        ["Nami"] = {
        [_Q] = { speed = math.huge, delay = 0.8, range = 850, width = 0, collision = false, aoe = true, type = "circular"}
    },
        ["Nautilus"] = {
        [_Q] = { speed = 2000, delay = 0.250, range = 1080, width = 80, collision = true, aoe = false, type = "linear"}
    },
        ["Nidalee"] = {
        [_Q] = { speed = 1300, delay = 0.125, range = 1500, width = 60, collision = true, aoe = false, type = "linear"},
    },
        ["Nocturne"] = {
        [_Q] = { speed = 1400, delay = 0.250, range = 1125, width = 60, collision = false, aoe = false, type = "linear"}
    },
        ["Olaf"] = {
        [_Q] = { speed = 1600, delay = 0.25, range = 1000, width = 90, collision = false, aoe = false, type = "linear"}
    },
        ["Quinn"] = {
        [_Q] = { speed = 1550, delay = 0.25, range = 1050, width = 80, collision = true, aoe = false, type = "linear"}
    },
        ["Rengar"] = {
        [_E] = { speed = 1500, delay = 0.50, range = 1000, width = 80, collision = false, aoe = false, type = "linear"}
    },
        ["Riven"] = {
        [_R] = { speed = 2200, delay = 0.5, range = 1100, width = 200, collision = false, aoe = false, type = "cone"}
    },
        ["Rumble"] = {
        [_E] = { speed = 2000, delay = 0.250, range = 950, width = 80, collision = false, aoe = false, type = "linear"}
    },
        ["Ryze"] = {
        [_Q] = { speed = 900, delay = 0.25, range = 900, width = 50, collision = true, aoe = false, type = "linear"}
    },
        ["Sejuani"] = {
        [_R] = { speed = 1600, delay = 0.250, range = 1200, width = 110, collision = false, aoe = false, type = "linear"}
    },
        ["Shyvana"] = {
        [_E] = { speed = 1500, delay = 0.250, range = 925, width = 60, collision = false, aoe = false, type = "linear"}
    },
        ["Sivir"] = {
        [_Q] = { speed = 1330, delay = 0.250, range = 1075, width = 0, collision = false, aoe = false, type = "linear"}
    },
        ["Skarner"] = {
        [_E] = { speed = 1200, delay = 0.600, range = 350, width = 60, collision = false, aoe = false, type = "linear"}
    },
        ["Sona"] = {
        [_R] = { speed = 2400, delay = 0.240, range = 1000, width = 160, collision = true, aoe = false, type = "linear"}
    },
        ["Swain"] = {
        [_W] = { speed = math.huge, delay = 0.850, range = 900, width = 125, collision = false, aoe = true, type = "circular"}
    },
        ["Syndra"] = {
        [_Q] = { speed = math.huge, delay = 0.600, range = 790, width = 125, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 2500, delay = 0.250, range = 700, width = 45, collision = false, aoe = true, type = "cone"}
    },
        ["Thresh"] = {
        [_Q] = { speed = 1900, delay = 0.500, range = 1050, width = 70, collision = true, aoe = false, type = "linear"}
    },
        ["Twitch"] = {
        [_W] = {speed = 1750, delay = 0.250, range = 950, width = 275, collision = false, aoe = true, type = "circular"}
    },
        ["TwistedFate"] = {
        [_Q] = { speed = 1500, delay = 0.250, range = 1200, width = 80, collision = false, aoe = false, type = "cone"}
    },
        ["Urgot"] = {
        [_Q] = { speed = 1600, delay = 0.2, range = 1400, width = 80, collision = true, aoe = false, type = "linear"},
        [_E] = { speed = 1750, delay = 0.3, range = 920, width = 200, collision = false, aoe = true, type = "circular"}
    },
        ["Varus"] = {
        --[_Q] = { speed = 1500, delay = 0.5, range = 1475, width = 100, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1750, delay = 0.25, range = 925, width = 235, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1200, delay = 0.5, range = 800, width = 100, collision = false, aoe = false, type = "linear"}
    },
        ["Veigar"] = {
        [_Q] = { speed = 1200, delay = 0.25, range = 875, width = 75, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 900, delay = 1.25, range = 900, width = 110, collision = false, aoe = true, type = "circular"}
    },
        ["Viktor"] = {
        [_W] = { speed = 750, delay = 0.6, range = 700, width = 125, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1200, delay = 0.25, range = 1200, width = 0, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 1000, delay = 0.25, range = 700, width = 0, collision = false, aoe = true, type = "circular"},
    },
        ["Velkoz"] = {
        [_Q] = { speed = 1300, delay = 0.066, range = 1050, width = 50, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1700, delay = 0.064, range = 1050, width = 80, collision = false, aoe = false, type = "linear"},
        [_E] = { speed = 1500, delay = 0.333, range = 850, width = 225, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = math.huge, delay = 0.333, range = 1550, width = 50, collision = false, aoe = false, type = "linear"}
    },    
        ["Xerath"] = {
        --[_Q] = { speed = 500, delay = 1.75, range = 750, width = 100, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.25, range = 1100, width = 100, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1600, delay = 0.25, range = 1050, width = 70, collision = true, aoe = false, type = "linear"},
        [_R] = { speed = 500, delay = 0.75, range = 3200, width = 245, collision = false, aoe = true, type = "circular"}
    },
        ["Yasuo"] = {
        [_Q] =  { speed = math.huge, delay = 250, range = 475, width = 40, collision = false, aoe = false, type = "linear"},
    },
        ["Zac"] = {
        [_Q] = { speed = 2500, delay = 0.110, range = 500, width = 110, collision = false, aoe = false, type = "linear"},
    },
        ["Zed"] = {
        [_Q] = { speed = 1700, delay = 0.25, range = 925, width = 50, collision = false, aoe = false, type = "linear"},
    },
        ["Ziggs"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1400, width = 155, collision = true, aoe = false, type = "linear"},
        [_W] = { speed = 1800, delay = 0.25, range = 970, width = 275, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1750, delay = 0.12, range = 900, width = 350, collision = false, aoe = true, type = "circular"},
        [_R] = { speed = 1750, delay = 0.14, range = 5300, width = 525, collision = false, aoe = true, type = "circular"},
    },
        ["Zilean"] = {
        [_Q] = { speed = math.huge, delay = 0.5, range = 900, width = 150, collision = false, aoe = true, type = "circular"},
    },
        ["Zyra"] = {
        [_Q] = { speed = math.huge, delay = 0.7, range = 800, width = 85, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1150, delay = 0.25, range = 1100, width = 70, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = math.huge, delay = 1, range = 1100, width = 500, collision=false, aoe = true, type = "circular" }
    }
}
--[[ Skillshot list end ]]--

--[[ Auto updater start ]]--
local version = 0.65
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/Aimbot.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."Aimbot.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>[Aimbot]:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/Aimbot.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        AutoupdaterMsg("New version available v"..ServerVersion)
        AutoupdaterMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        AutoupdaterMsg("Loaded the latest version (v"..ServerVersion..")")
      end
    end
  else
    AutoupdaterMsg("Error downloading version info")
  end
end
--[[ Auto updater end ]]--

--[[ Libraries start ]]--
local predToUse = {}
VP = nil
DP = nil
HP = nil
if FileExist(LIB_PATH .. "VPrediction.lua") then
  require("VPrediction")
  VP = VPrediction()
  table.insert(predToUse, "VPrediction")
end

if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
  require "DivinePred"
  DP = DivinePred() 
  table.insert(predToUse, "DivinePred")
end

if FileExist(LIB_PATH .. "HPrediction.lua") then
  require("HPrediction")
  HP = HPrediction()
  table.insert(predToUse, "HPrediction")
end

--[[ 

if VIP_USER and FileExist(LIB_PATH .. "/Prodiction.lua") then
  require("Prodiction")
  prodstatus = true
end
]]--
--[[ Libraries end ]]--

--[[ Script start ]]--
if not Champs[myHero.charName] then return end -- not supported :(
HookPackets() -- Credits to iCreative
local data = Champs[myHero.charName]
local QReady, WReady, EReady, RReady = nil, nil, nil, nil
local Target 
local QSel, WSel, ESel, RSel
local str = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }
--local key = { [_Q] = "Y", [_W] = "X", [_E] = "C", [_R] = "V" } soon
local toCast = {false, false, false, false}
local toAim = {false, false, false, false}
local debugMode = false
enemyMinions = minionManager(MINION_ENEMY, 2000, myHero, MINION_SORT_HEALTH_ASC)
jungleMinions = minionManager(MINION_JUNGLE, 2000, myHero, MINION_SORT_MAXHEALTH_DEC)
otherMinions = minionManager(MINION_OTHER, 2000, myHero, MINION_SORT_HEALTH_ASC)
local opcs = {{0x87, 0xEC, 0x6C, 0x74, 0x98}, {0x00E9, 0x02, 0xD8, 0xB3, 0xE7}}
local opcpos = {23, 27}

function OnLoad()

  Config = scriptConfig("[Aimbot] "..myHero.charName, "Aimbot1"..myHero.charName)
  
  Config:addSubMenu("Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("ser",  "Which LoL version?", SCRIPT_PARAM_LIST, 1, {"5.8", "5.7"})
  Config.misc:addParam("qq", " ", SCRIPT_PARAM_INFO,"")
  if predToUse == {} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro",  "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)
  if ActivePred() == "DivinePred" then
	Config.misc:addParam("time","DPred Extra Time", SCRIPT_PARAM_SLICE, 0.13, 0, 1, 1)
  end
    
  if ActivePred() == "HPrediction" then SetupHPred() end
 
  Config:addSubMenu("Supported skill settings", "skConfig")
  Config.skConfig:addParam("nfo", "0 = Off, 1 = Predict/Mouse, 2 = Predict Only", SCRIPT_PARAM_INFO,"")
  for i=0,3 do
    if data[i] ~= nil then
        Config.skConfig:addParam(str[i], ""..str[i], SCRIPT_PARAM_SLICE, 1, 0, 2, 0)
        toAim[i] = true
    end
  end

  --Config:addSubMenu("Lasthit config", "lhConfig")

  
  --Config:addSubMenu("Additional keys", "kConfig")
  --for i, spell in pairs(data) do
  --  Config.kConfig:addParam(key[i], "Aim "..str[i], ConfigType, false, string.byte(key[i]))
  --end soon; for free users
  
  Config:addParam("tog", "Aimbot on/off", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("T"))
  --Config:addParam("lh", "Last Hit (hold)", SCRIPT_PARAM_ONKEYDOWN, true, string.byte("X"))
  
  Config:permaShow("tog")
  if toAim[0] then QSel = TargetSelector(TARGET_NEAR_MOUSE, data[0].range, DAMAGE_MAGIC, true) end
  if toAim[1] then WSel = TargetSelector(TARGET_NEAR_MOUSE, data[1].range, DAMAGE_MAGIC, true) end
  if toAim[2] then ESel = TargetSelector(TARGET_NEAR_MOUSE, data[2].range, DAMAGE_MAGIC, true) end
  if toAim[3] then RSel = TargetSelector(TARGET_NEAR_MOUSE, data[3].range, DAMAGE_MAGIC, true) end
end

function ActivePred()
    local int = Config.misc.pro
    return tostring(predToUse[int])
end

function SetupHPred()
    if toAim[0] then 
        Spell_Q = MakeHPred(Spell_Q, i) 
    end
    if toAim[1] then 
        Spell_W = MakeHPred(Spell_W, i) 
    end
    if toAim[2] then 
        Spell_E = MakeHPred(Spell_E, i) 
    end
    if toAim[3] then 
        Spell_R = MakeHPred(Spell_R, i) 
    end
end

function MakeHPred(hspell, i)
    hspell.collisionM[myHero.charName] = data[i].collision
    hspell.collisionH[myHero.charName] = data[i].collision
    hspell.delay[myHero.charName] = data[i].delay
    hspell.range[myHero.charName] = data[i].range
    if data[i].type == "linear" then
        hspell.width[myHero.charName] = 2*data[i].width
        if data[i].speed ~= math.huge then 
            hspell.type[myHero.charName] = "DelayLine"
            hspell.speed[myHero.charName] = data[i].speed
        else
            hspell.type[myHero.charName] = "PromptLine"
        end
    elseif data[i].type == "circular" then
        hspell.radius[myHero.charName] = data[i].width
        if data[i].speed ~= math.huge then 
            hspell.type[myHero.charName] = "DelayCircle"
            hspell.speed[myHero.charName] = data[i].speed
        else
            hspell.type[myHero.charName] = "PromptCircle"
        end
    else --Cone!
        hspell.type[myHero.charName] = "DelayLine"
        hspell.width[myHero.charName] = data[i].width
    end
    return hspell
end

function OnTick()
  -- [[ Last hitter part ]] --
  --if Config.lh and not myHero.dead and not recall then 
  --end
  -- [[ Real aimbot part ]] --
  if Config.tog and not myHero.dead and not recall and IsLeeThreshNidaJayceQ() and ValidRequest() and (toCast[0] or toCast[1] or toCast[2] or toCast[3]) then -- 
      for i, spell in pairs(data) do
          Target = GetCustomTarget(i)
          if Target == nil then return end
          if (toCast[i] and Config.skConfig[str[i]] > 0) and myHero:CanUseSpell(i) then
            if IsJayceQ(i) then 
                if myHero:CanUseSpell(_E) then 
                    data[0] = { speed = 2350, delay = 0.15, range = 1750, width = 70, collision = true, aoe = false, type = "linear"}
                    if ActivePred() == "HPrediction" then SetupHPred() end
                    CCastSpell(_E, myHero.x, myHero.z) DelayAction(function() end, 0.15) 
                else 
                    data[0] = { speed = 1300, delay = 0.15, range = 1150, width = 70, collision = true, aoe = false, type = "linear"}
                    if ActivePred() == "HPrediction" then SetupHPred() end
                end 
            end
            if ActivePred() == "VPrediction" then
              local CastPosition, HitChance, Position = VPredict(Target, spell)
              if debugMode then PrintChat("1 - Attempt to aim!") end
              if HitChance >= 2 then
                  if debugMode then PrintChat("2 - Aimed skill! Precision: "..HitChance) end
                  CCastSpell(i, CastPosition.x, CastPosition.z)
              elseif HitChance >= 1 then
                  if debugMode then PrintChat("2 - Aimed skill! Precision: "..HitChance) end
                  CCastSpell(i, CastPosition.x, CastPosition.z)
              else
                  local enemies = EnemiesAround(Target, 500) -- Maybe needs some adjustment
                  if enemies > 0 then
                    if debugMode then PrintChat("2 - Checking other enemies around target...") end
                    Target = GetNextCustomTarget(i, Target)
                   if ValidTarget(Target) then
                    local CastPosition, HitChance, Position = VPredict(Target, spell)
                    if HitChance >= 2 then
                      if not myHero:CanUseSpell(i) then return end
                      if debugMode then PrintChat("3 - Aimed skill! Precision: "..HitChance) end
                      CCastSpell(i, CastPosition.x, CastPosition.z)
                    elseif HitChance >= 1 then
                      if not myHero:CanUseSpell(i) then return end
                      if debugMode then PrintChat("3 - Aimed skill! Precision: "..HitChance) end
                      CCastSpell(i, CastPosition.x, CastPosition.z)
                    end
                   end
                   if myHero:CanUseSpell(i) then
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("3 - No better target found - to mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
                   end
                  else
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("2 - To mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
                  end
              end toCast[i] = false
            elseif ActivePred() == "DivinePred" and VIP_USER then -- DivinePrediction
			  local State, Position, perc
			  State, Position, perc = DPredict(Target, spell)
              if debugMode then PrintChat("1 - Attempt to aim!") end
              if State == SkillShot.STATUS.SUCCESS_HIT then 
                if debugMode then PrintChat("2 - Aimed skill! Precision: "..perc) end
                CCastSpell(i, Position.x, Position.z)
              else
                local enemies = EnemiesAround(Target, 500) -- Maybe needs some adjustment
                if enemies > 0 then
                  if debugMode then PrintChat("2 - Checking other enemies around target...") end
				  GetNextCustomTarget(i, Target)
				  unit = DPTarget(Target)
				  State, Position, perc = DP:predict(unit, Spell, 1.2)
				  if State == SkillShot.STATUS.SUCCESS_HIT then 
                  if debugMode then PrintChat("3 - Aimed skill! Precision: "..perc.."%") end
					CCastSpell(i, Position.x, Position.z)
				  else
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("3 - No better target found - to mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
				  end
				else
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("2 - To mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
				end
              end toCast[i] = false
            elseif ActivePred() == "HPrediction" then -- HPrediction
              local Position, HitChance
			  Position, HitChance = HPredict(Target, str[i])
              if debugMode then PrintChat("1 - Attempt to aim!") end
              if HitChance >= 2 then
                  if debugMode then PrintChat("2 - Aimed skill! Precision: "..HitChance) end
                  CCastSpell(i, Position.x, Position.z)
              elseif HitChance >= 1.5 then
                  if debugMode then PrintChat("3 - Aimed skill! Precision: "..HitChance) end
                  CCastSpell(i, Position.x, Position.z)
              else
                  local enemies = EnemiesAround(Target, 500) -- Maybe needs some adjustment
                  if enemies > 0 then
                    if debugMode then PrintChat("2 - Checking other enemies around target...") end
                    Target = GetNextCustomTarget(i, Target)
                   if ValidTarget(Target) then
                    local Position, HitChance = HPredict(Target, str[i])
                    if HitChance >= 2 then
                      if not myHero:CanUseSpell(i) then return end
                      if debugMode then PrintChat("3 - Aimed skill! Precision: "..HitChance) end
					  CCastSpell(i, Position.x, Position.z)
                    elseif HitChance >= 1.5 then
                      if not myHero:CanUseSpell(i) then return end
                      if debugMode then PrintChat("3 - Aimed skill! Precision: "..HitChance) end
					  CCastSpell(i, Position.x, Position.z)
                    end
                   end
                   if myHero:CanUseSpell(i) then
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("3 - No better target found - to mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
                   end
                  else
                    if Config.skConfig[str[i]] == 1 then if debugMode then PrintChat("2 - To mouse") end CCastSpell(i, mousePos.x, mousePos.z) end
                  end
              end toCast[i] = false
            end
          end
      end 
  end
end   

function EnemiesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

local LastRequest = 0
function ValidRequest()
    if os.clock() - LastRequest < TimeRequest() then
        return false
    else
        LastRequest = os.clock()
        return true
    end
end

function TimeRequest()
    if ActivePred() == "VPrediction" or ActivePred() == "HPrediction" then
        return 0.001
    elseif ActivePred() == "DivinePred" then
        return Config.misc.time~=nil and Config.misc.time or 0.2
    end
end

function HPredict(Target, spell)
	return HP:GetPredict(spell, Target, myHero)
end

function DPredict(Target, spell)
  local unit = DPTarget(Target)
  local col = (spell.aoe and spell.collision) and 0 or math.huge
  if IsVeigarLuxQ(i) then col = 1 end
  if spell.type == "linear" then
	Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
	Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
	Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return DP:predict(unit, Spell)
end

function VPredict(Target, spell)
  if spell.type == "linear" then
	if spell.aoe then
		return VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "circular" then
	if spell.aoe then
		return VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "cone" then
	if spell.aoe then
		return VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  end
end

function OnWndMsg(msg, key)
   if msg == KEY_UP and key == GetKey("Q") and toAim[0] then
     toCast[0] = false
   elseif msg == KEY_UP and key == GetKey("W") and toAim[1] then 
     toCast[1] = false
   elseif msg == KEY_UP and key == GetKey("E") and toAim[2] then 
     toCast[2] = false
   elseif msg == KEY_UP and key == GetKey("R") and toAim[3] then
     toCast[3] = false
   end
end

function IsVeigarLuxQ(i)
  if myHero.charName == 'Lux' then
    if i == 0 then
      return true
    else
      return false
    end
  elseif myHero.charName == 'Veigar' then
    if i == 0 then
      return true
    else
      return false
    end 
  else
    return false
  end
end

function IsLeeThreshNidaJayceQ()
    if myHero.charName == 'LeeSin' then
        if myHero:GetSpellData(_Q).name == 'BlindMonkQOne' then
            return true
        else
            return false
        end
    elseif myHero.charName == 'Thresh' then
        if myHero:GetSpellData(_Q).name == 'ThreshQ' then
            return true
        else
            return false
        end 
    elseif myHero.charName == 'Jayce' then
        if myHero:GetSpellData(_Q).name == 'jayceshockblast' then
            return true
        else
            return false
        end 
    elseif myHero.charName == 'Nidalee' then
        if myHero:GetSpellData(_Q).name == 'JavelinToss' then
            return true
        else
            return false
        end 
    else 
        return true
    end
end

function IsJayceQ(i)
  if myHero.charName == 'Jayce' then
    if i == 0 then
      return true
    else
      return false
    end
  else
    return false
  end
end

function OnDraw()
  if not debugMode or myHero.dead then
    return
  end
    if myHero.hasMovePath and myHero.pathCount >= 2 then
      local IndexPath = myHero:GetPath(myHero.pathIndex)
      if IndexPath then
        DrawLine3D(myHero.x, myHero.y, myHero.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
      end
      for i=myHero.pathIndex, myHero.pathCount-1 do
        local Path = myHero:GetPath(i)
        local Path2 = myHero:GetPath(i+1)
        DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
      end
    end
    for i, enemy in ipairs(GetEnemyHeroes()) do
      if enemy == nil then
        return
      end
      if enemy.hasMovePath and enemy.pathCount >= 2 then
        local IndexPath = enemy:GetPath(enemy.pathIndex)
        if IndexPath then
          DrawLine3D(enemy.x, enemy.y, enemy.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
        end
        for i=enemy.pathIndex, enemy.pathCount-1 do
          local Path = enemy:GetPath(i)
          local Path2 = enemy:GetPath(i+1)
          DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
        end
      end
    end
end

function OnSendPacket(p)
  if Config.tog and not myHero.dead and IsLeeThreshNidaJayceQ() then
    if p.header == opcs[Config.misc.ser][1] then -- old: 0x00E9
        p.pos=opcpos[Config.misc.ser]
        local opc = p:Decode1()
		if debugMode then print("Opcode "..opc.." "..('0x%02X'):format(opc)) end
        for i=0,3 do
            if opc == opcs[Config.misc.ser][i+2] and not toCast[i] and toAim[i] and Config.skConfig[str[i]] > 0 then -- old: 0x02
              Target = GetCustomTarget(i)
              if Target ~= nil then
                p:Block()
                p.skip(p, 1)
    			toCast[i] = true
              end
            end
        end
    end
  end
end

function GetCustomTarget(i)
    if toAim[0] then QSel:update() end
    if toAim[1] then WSel:update() end
    if toAim[2] then ESel:update() end
    if toAim[3] then RSel:update() end
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    if i == 0 then
      return QSel.target
    elseif i == 1 then
      return WSel.target
    elseif i == 2 then
      return ESel.target
    elseif i == 3 then
      return RSel.target
    else
      return nil
    end
end

function GetNextCustomTarget(i, tar)
	local targ = nil
	for _, unit in pairs(GetEnemyHeroes()) do
		if targ and targ.valid and unit and unit.valid and unit ~= tar then
			if GetDistance(unit, mousePos) < GetDistance(targ, mousePos) then
				targ = unit
			end
		else
			targ = unit
		end
	end
	return targ
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end