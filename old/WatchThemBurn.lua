if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end local call = false
function OnTick() 
	for _,enemy in pairs(GetEnemyHeroes()) do 
		if ValidTarget(enemy, 450) and 50+20*myHero.level/2 > enemy.health and Ignite then 
			CastSpell(Ignite, enemy) 
			DelayAction(function() 
					if enemy.dead and EnemiesAround(myHero,750) < 3 then 
						call = true 
					end 
				end, 1) 
		end 
	end 
	if call and Ignite then 
		DelayAction(function() call = false end, 3) 
		CastSpell(RECALL) 
	end 
end 
function OnLoad()
	CastSpell(RECALL) 
end
function OnWndMsg(Msg, Key)
	if Msg == WM_LBUTTONDOWN then 
		print("rec")
		CastSpell(RECALL) 
	end
end
function EnemiesAround(Unit, range) local c=0 if Unit == nil then return 0 end for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c end
print("Watch Them Burn Script Activated.")