--[[
	-- Written by Evaneos[KOWAR]
	-- Timestamp: 03/20/2018
]]

E2Lib.RegisterExtension("Server-library", true,"Allows you to check server state(latency, cpu usage, memory, etc)")


-------------------------------------------------------------------------------------------------------------------------------

local lastTickDeltaTime   = 9999
local RoundedDelta    = 0


local function GetDifferential()
	local DeltaTime = SysTime() - CurTime() 
	RoundedDelta    = math.Round(DeltaTime - lastTickDeltaTime, 3 * 2)
	lastTickDeltaTime   = DeltaTime
	return RoundedDelta
end

e2function number isServerLaggingS()
	return GetDifferential() > 0.05  and 1 or 0
end

e2function number isServerLaggingM()
	return GetDifferential() > 0.075 and 1 or 0
end

e2function number isServerLaggingH()
	return GetDifferential() > 0.1   and 1 or 0
end

e2function number getLatency(clearTime)
	if clearTime >= 1 then 
		return nil 
	end 
	return GetDifferential() > clearTime and 1 or 0
end

e2function number engineFrameTime()
	return engine.TickInterval()
end

e2function number getServerFPS()
	return ( 1 / engine.TickInterval() )
end
util.AddNetworkString("e2_extensions_server_fps_2")
util.AddNetworkString("e2_extensions_server_fps_2_callback")
e2function number getServerFPS2()

	net.Start("e2_extensions_server_fps_2")
	net.WriteBool(true)
	net.Send(self.player)
	
	net.Receive("e2_extensions_server_fps_2_callback",function(len,ply)
		local allowed = net.ReadBool  ()
		local svFPS   = net.ReadString()
		if !allowed then
			return
		end
		
		return svFPS
	
	end)
	return svFPS
end


e2function number getMemoryUsedK()
	return ( collectgarbage("count") )
end

e2function number getMemoryUsedM()
	local Memory = collectgarbage("count")
	return ( Memory / 1024 )
end