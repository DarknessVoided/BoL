--[[
       _____  _____                 _  _        _    _               
      / ____||  __ \               | |(_)      | |  (_)              
     | (___  | |__) |_ __  ___   __| | _   ___ | |_  _   ___   _ __  
      \___ \ |  ___/| '__|/ _ \ / _` || | / __|| __|| | / _ \ | '_ \ 
      ____) || |    | |  |  __/| (_| || || (__ | |_ | || (_) || | | |
     |_____/ |_|    |_|   \___| \__,_||_| \___| \__||_| \___/ |_| |_|
                                                                 
       
        By Scriptologe a.k.a Nebelwolfi

        How To Use:

            require("SPrediction")
            SP = SPrediction()

            Position, Chance, Direction = SP:Predict(_Q, myHero, Target)
            if Chance >= X then
                CastSpell(_Q, Position.x, Position.y)
            end

        Position is the predicted position of the target
            If chance is 0 the target position will be returned instead

        Chance can go from 0 to 3
             0:  Will not hit
             1:  50% Hitchance
             2:  75% Hitchance
             3: >90% Hitchance

        Direction the target walks to
            Vector otherwise nil
]]--     

_G.SPredictionAutoUpdate = true
_G.SPredictionVersion    = 2.45
_G.SPredictionLastUpdate = "Improved anti-bait behaviour"

assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("VILKLQPMJQM") 

assert(load(Base64Decode("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"), nil, "bt", _ENV))()

-- Copy line