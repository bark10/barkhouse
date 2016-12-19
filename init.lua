-- Load modfiles
local modpath = minetest.get_modpath("barkhouse")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/items.lua")
dofile(modpath .. "/crafting.lua")
dofile(modpath .. "/tools.lua")
dofile(modpath .. "/bathroom.lua")

minetest.register_chatcommand("foo", {
	privs = {
		interact = true
	},

	func = function(name, param)
		return true, "You said " .. param .. "!"
	--	core.colorize(0xFF0000, "You said " .. param .. "!") 

	end
})
--[==[

while 

local player = 
local message = 


ide:  /team join eller leave
man kan være i mange team.
autoswitching i teamchat når teammaytes er på og ikke


local player = minetest.get_player_by_name(target)

--]==]		
