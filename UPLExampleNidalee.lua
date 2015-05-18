require("UPL")
UPL = UPL()

function OnLoad()
    ...
    scriptConfig("UPLExampleMenu", "UPLExampleMenu")
    UPL:AddToMenu(Menu)
    --Will add prediction selector to the given scriptConfig

    UPL:AddSpell(_Q, { speed = 1800, delay = 0.25, range = 900, width = 70, collision = true, aoe = false, type = "linear" })
    --delay in seconds, width of a circular spell is radius
    --Will add the spell to all predictions, here: Blitz Q
end

function OnTick()
    CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
    if HitChance >= X then
      CastSpell(_Q, CastPosition.x, CastPosition.y)
    end
end