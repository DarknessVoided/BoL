_G.OneTickOneActionDelay = 0.03

functions, lastTickT, lastTickF = {}, 0, 0
function AddTick(func, id)
	if lastTickF == 0 then
		AddTickCallback(OneTickOneAction)
	end
	if id then
		functions[id] = func
	else
		table.insert(functions, func)
	end
end

function RemoveTick(id)
	functions[id] = nil
end

function OneTickOneAction()
	local time = os.clock()
	if lastTickT + OneTickOneActionDelay < time then
		local f, fI = CountAndIndexFuncs()
		lastTickF = lastTickF + 1
		if lastTickF > f then 
			lastTickF = 1 
		end
		if fI[lastTickF] then fI[lastTickF]() end
		lastTickT = time
	end 
end

function CountAndIndexFuncs()
	local f = 0
	local fI = {}
	for _, func in pairs(functions) do
		f = f + 1
		fI[f] = func
	end
	return f, fI
end
