function OnTick()
	SendChat("/surrender")
end

function OnDraw()
	DrawHitBox(myHero, 2, ARGB(255,255,255,255))
	DrawArrows(myHero, mousePos, 50, 0xFFFFFF, 150)
	DrawCircle3D(myHero.x, myHero.y, myHero.z, GetDistance(myHero.minBBox, myHero.pos), 1, ARGB(255,255,255,255), 32)
	if myHero.hasMovePath and myHero.pathCount >= 2 then
		local IndexPath = myHero:GetPath(myHero.pathIndex)
		if IndexPath then
			DrawLine3D(myHero.x, myHero.y, myHero.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
			DrawArrows(myHero, IndexPath, 50, 0xFFFFFF, 15)
		end
		for i=myHero.pathIndex, myHero.pathCount-1 do
			local Path = myHero:GetPath(i)
			local Path2 = myHero:GetPath(i+1)
			DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
			DrawArrows(myHero, Path, 25, 0xFFFFFF, 1)
		end
	end
	for i, enemy in ipairs(GetEnemyHeroes()) do
		DrawHitBox(enemy, 2, ARGB(255,255,255,255))
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

print("Hitbox helper loaded!")