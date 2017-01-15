--[[
Copyright (C) 2017 bark

License for Code
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

License for Textures, Models and Sounds
Gold and bark: CC-BY-SA 4.0
--]]

minetest.register_node(":default:acacia_wood", {
	description = "Acacia Wood",
	tiles = {"newblocks_acacia_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node(":default:wood", {
	description = "Wood",
	tiles = {"newblocks_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node(":default:aspen_wood", {
	description = "Aspen Wood",
	tiles = {"newblocks_aspen_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node(":default:junglewood", {
	description = "Jungle Wood",
	tiles = {"newblocks_jungle_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node(":default:pine_wood", {
	description = "Pine Wood",
	tiles = {"newblocks_pine_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:jungletree", {
	description = "Jungle Tree",
	tiles = {"newblocks_jungletree_top.png", "newblocks_jungletree_top.png",
		"newblocks_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})
