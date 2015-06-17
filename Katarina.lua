if myHero.charName ~= "Katarina" then return end
function OnLoad() 
	ForceTarget = nil lastAttack = 0 previousAttackCooldown = 0 previousWindUp = 0 ultOn = 0 
	targetSelector = TargetSelector(TARGET_LESS_CAST, 700, DAMAGE_MAGICAL, false, true) 
	cfg = scriptConfig("Definitely Katarina", "DKatarina") 
	cfg:addParam("k", "Combo (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32) 
end 

function OnTick() 
	targetSelector:update() 
	target = targetSelector.target 
	if Forcetarget ~= nil and ValidTarget(Forcetarget, 900) then 
		target = Forcetarget 
	end 
		if cfg.k then 
		if GetDistance(mousePos) > myHero.boundingRadius and heroCanMove() and not (target and GetDistance(target) < myHero.range+myHero.boundingRadius+target.boundingRadius-25) then 
			myHero:MoveTo(mousePos.x, mousePos.z) 
		end 
			if timeToShoot() and target then for _,k in pairs({_Q,_E}) do CastSpell(k, target) 
			end 
			if GetDistance(target) < 375 then CastSpell(_W) 
			end
		end 
			if target and GetDistance(target) < 350 then CastSpell(_R) 
				end 
			if target and GetDistance(target) < myHero.range+myHero.boundingRadius+target.boundingRadius+25 and timeToShoot() then 
				myHero:Attack(target) 
			end 
	end 				
end 

function ProcessSpell(unit, spell) 
	if unit and unit.isMe and spell then lastAttack = GetTickCount() - GetLatency()/2 previousWindUp = spell.windUpTime*1000 previousAttackCooldown = spell.animationTime*1000 
		if spell.name:lower():find("katarinar") then 
		ultOn = GetInGameTimer()+2.5 
		end 
	end 
end

function timeToShoot() 
	return (GetTickCount() + GetLatency()/2 > lastAttack + previousAttackCooldown) and (ultOn < GetInGameTimer() or target.dead) 
end 

function heroCanMove() 
	return (GetTickCount() + GetLatency()/2 > lastAttack + previousWindUp + 50) and (ultOn < GetInGameTimer() or target.dead) 
end 

function OnWndMsg(Msg, Key) 
	if Msg == WM_LBUTTONDOWN then 
		local minD = 0 
		local starget = nil 
		for i, enemy in ipairs(GetEnemyHeroes()) do 
			if ValidTarget(enemy) then 
				if GetDistance(enemy, mousePos) <= minD or starget == nil then minD = GetDistance(enemy, mousePos) starget = enemy 
				end 
			end 
		end 
		if starget and minD < 500 then 
			if Forcetarget and starget.charName == Forcetarget.charName then 
				Forcetarget = nil 
			else 
				Forcetarget = starget 
				print("<font color=\"#FF0000\">Definitely Katarina: New target selected: "..starget.charName.."</font>") 
			end 
		end 
	end
end
print("<font color=\"#FF0000\">Definitely Katarina Script Activated.</font>")