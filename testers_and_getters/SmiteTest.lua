function OnTick()
	for k,v in pairs(GetAllyHeroes()) do
		print(hasSmite(v, 4))
	end
end
function hasSmite(unit, slot)
  if unit == nil then return end
  for i=1, unit.buffCount do
   local buff = unit:getBuff(i)
	 if buff and buff.valid and buff.name then 
		if string.find(buff.name, "smite") then return unit:GetSpellData(slot).currentCd == 0 end
	 end
  end
  return false
end

--and buff.name ~= "smitedamagetracker"