require("UPL")
UPL = UPL()

function OnLoad()
    Config = scriptConfig("Ezreal Q Aim", "UPLExampleEzreal")
    Config:addParam("shoot", "Shoot", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config:permaShow("shoot")
    targetSelector = TargetSelector(TARGET_LESS_CAST, 1500, DAMAGE_MAGIC, true)
    Config:addParam("hc", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
    UPL:AddToMenu(Config)
    UPL:AddSpell(_Q, { speed = 1975, delay = 0.25, range = 1200, width = 50, collision = true, aoe = false, type = "linear" })
end

function OnTick()
    targetSelector:update()
    if targetSelector.target == nil or not Config.shoot then return end
    CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, targetSelector.target)
    if HitChance >= Config.hc then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
end