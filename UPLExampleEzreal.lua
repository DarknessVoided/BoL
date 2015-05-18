require("UPL")
UPL = UPL()

function OnLoad()
    Config = scriptConfig("Ezreal Q Aim", "UPLExampleEzreal")
    Config:addParam("shoot", "Shoot", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    UPL:AddToMenu(Config)
    sts = TargetSelector(TARGET_LESS_CAST, 1500, DAMAGE_MAGIC, true)
    UPL:AddSpell(_Q, { speed = 1975, delay = 0.25, range = 1200, width = 50, collision = true, aoe = false, type = "linear" })
end

function OnTick()
    sts:update()
    if sts.target == nil or not Config.shoot then return end
    CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, sts.target)
    if HitChance >= 2 then
      CastSpell(_Q, CastPosition.x, CastPosition.z)
    end
end