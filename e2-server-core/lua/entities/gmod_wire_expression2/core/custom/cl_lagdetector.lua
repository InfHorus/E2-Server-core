--[[
	-- Written by Evaneos[KOWAR]
	-- Timestamp: 03/20/2018
]]

E2Helper.Descriptions["isServerLaggingS"] = "Returns wether or not the server is lagging (S means sensitive detection [clearTime = 0.05])"

E2Helper.Descriptions["isServerLaggingM"] = "Returns wether or not the server is lagging (Middle sensitive [clearTime = 0.075])"

E2Helper.Descriptions["isServerLaggingH"] = "Returns wether or not the server is lagging (Heavy latency [clearTime = 0.1])"

E2Helper.Descriptions["getServerFPS"]     = "Returns the server frame per second)"

E2Helper.Descriptions["getServerFPS2"]    = "Returns the server frame per second, differently calculated and formatted ( better for benchmarking )"

E2Helper.Descriptions["engineFrameTime"]  = "Returns the server tickrate affected by lags ( useful for benchmarking )"

E2Helper.Descriptions["getMemoryUsedK"]   = "Returns the current floored dynamic memory usage of Lua in kilobytes"

E2Helper.Descriptions["getMemoryUsedM"]   = "Returns the current floored dynamic memory usage of Lua in megabytes"

 
 
net.Receive ("e2_extensions_server_fps_2",
	function(len)
		local engineT    = engine.TickInterval()
		local serverF    = 1 / engineT
		local lastTick   = engineT
		local ServerFunc = engine.ServerFrameTime or function() 
			return -1 
		end
		local softFrames,jitter = ServerFunc ()
		local serverF    = 1 / softFrames
		local RelativeFT = FrameTime () * 2
		lastTick         = lastTick * RelativeFT + softFrames * ( 1 - RelativeFT )
		local lastTick   = 1 / lastTick
		local toReturn   = ("%2.0f (%2.0f)"):format(serverF,lastTick)
		
		net.Start("e2_extensions_server_fps_2_callback")
		net.WriteBool(true)
		net.SendToServer()
	end
)