-- Graywood
minetest.register_node("barkhouse:graywood", {
	description = "Graywood",
tiles = {
		"barkhouse_graywood.png",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),

})
minetest.register_node("barkhouse:graywood_pine", {
	description = "Light Graywood",
tiles = {
		"barkhouse_graywood_pine.png",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),

})
minetest.register_node("barkhouse:graywood_jungle", {
	description = "Dark Graywood",
tiles = {
		"barkhouse_graywood_jungle.png",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),

})

-- Wardrobe (decorative)
minetest.register_node("barkhouse:wardrobe", {
      description = "Wardrobe",
      paramtype2 = "facedir",
      tiles = {
                 "wardrobe_wardrobe_topbottom.png",
                 "wardrobe_wardrobe_topbottom.png",
                 "wardrobe_wardrobe_sides.png",
                 "wardrobe_wardrobe_sides.png",
                 "wardrobe_wardrobe_sides.png",
                 "wardrobe_wardrobe_front.png"
              },
      inventory_image = "wardrobe_wardrobe_front.png",
      sounds = default.node_sound_wood_defaults(),
      groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 3 },
   });

minetest.register_craft(
   {
      output = "wardrobe:wardrobe",
      recipe = { { "group:wood", "group:stick", "group:wood" },
                 { "group:wood", "group:wool",  "group:wood" },
                 { "group:wood", "group:wool",  "group:wood" } }
   });

-- Iron Bar Floor
minetest.register_node("barkhouse:iron_bar_floor", {
	description = "Iron Bars (floor)",
	tiles = {
		"barkhouse_iron_bar_floor.png",
		"barkhouse_iron_bar_floor.png",
		"blank.png",
		"blank.png",
		"blank.png",
		"blank.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 1, stone = 2},	
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.130000, -0.5, 0.5, 0.220000, 0.5}, -- NodeBox1
		}
	}
})

-- Plaster Block
minetest.register_node("barkhouse:plaster", {
	description = "Plaster Block",
	tiles = {
		"barkhouse_plaster.png",
	},
	groups = {cracky = 1, stone = 2}
})


-- Make obsidian drop coins
minetest.register_node(":default:obsidian", {
	description = "Obsidian",
	tiles = {"barkhouse_obsidian.png"},
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'barkhouse:coin'},
				rarity = 150,
			},
			{
				items = {'default:obsidian'},
			}
		}
	},
})


-- Lottery Block
minetest.register_node("barkhouse:lotteryblock", {
   description = "Lottery Block",
   tiles = {"barkhouse_lotteryblock.png"},
   groups = {cracky = 3, stone = 1},
   sounds = default.node_sound_stone_defaults(),
   on_rightclick = function(pos, node, player, itemstack)
      local itemname = itemstack:get_name()
      local inv = player:get_inventory()
      local name = player:get_player_name()
      if itemname == "barkhouse:coin" then
         itemstack:take_item()
         player:set_wielded_item(itemstack)
         minetest.chat_send_player(name,"You rolled the dice at the lottery.")   
         minetest.chat_send_player(name,"**********************************")   
            local random_number = math.random(1, 100) -- Between 1 and 4.
            if (random_number >= 1) and (random_number <= 10) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and won the first prize:")
            minetest.chat_send_all("5x Nyancat Rainbows!")
            inv:add_item("main", "default:nyancat_rainbow 5")
            return
            elseif (random_number >= 11) and (random_number <= 31) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Five Diamond Blocks!")
            inv:add_item("main", "default:diamondblock 5")
            return
            elseif (random_number >= 32) and (random_number <= 65) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Twenty Steel Blocks!")
            inv:add_item("main", "default:steelblock 20")
            return
            elseif (random_number >= 66) and (random_number <= 100) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Fifty Obsidian!")
            inv:add_item("main", "default:obsidian 50")
            return
         end
      else
         minetest.chat_send_player(name,"You are not holding a coin..")
      end
   end,
})


-- Fluorescent blocks

minetest.register_node("barkhouse:fluorescent_water_source", {
	description = "Fluorescent Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "barkhouse_fluorescent_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "barkhouse_fluorescent_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	light_source = 10,	
alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "barkhouse:fluorescent_water_flowing",
	liquid_alternative_source = "barkhouse:fluorescent_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("barkhouse:fluorescent_water_flowing", {
	description = "Fluorescent Water",
	drawtype = "flowingliquid",
	tiles = {"barkhouse_fluorescent_water_flowing_animated.png"},
	special_tiles = {
		{
			name = "barkhouse_fluorescent_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "barkhouse_fluorescent_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	light_source = 10,	
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "barkhouse:fluorescent_water_flowing",
	liquid_alternative_source = "barkhouse:fluorescent_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})


minetest.register_node("barkhouse:fluorescent_dirt", {
	description = "Fluorescent Dirt",
	tiles = {"barkhouse_fluorescent_dirt.png"},
	groups = {crumbly = 3, soil = 1},	
	light_source = 10,
	sounds = default.node_sound_dirt_defaults(),	

})

minetest.register_node("barkhouse:fluorescent_dirt_with_grass", {
	description = "Fluorescent Dirt with Grass",
	tiles = {"barkhouse_fluorescent_grass.png", "barkhouse_fluorescent_dirt.png",
		{name = "barkhouse_fluorescent_dirt.png^barkhouse_fluorescent_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
		light_source = 10,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("barkhouse:fluorescent_leaves", {
	description = "Fluorescent Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"barkhouse_fluorescent_leaves.png"},
	special_tiles = {"barkhouse_fluorescent_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),	
	light_source = 10,
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:leaves'},
			}
		}
	},
})

minetest.register_node("barkhouse:fluorescent_tree", {
	description = "Fluorescent Tree",
	tiles = {"barkhouse_fluorescent_tree_top.png", "barkhouse_fluorescent_tree_top.png",
		"barkhouse_fluorescent_tree.png"},
	paramtype2 = "facedir",
	light_source = 10,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("barkhouse:powered_torch", {
	description = "Powered Torch",
	drawtype = "torchlike",
	tiles = {
		{
			name = "barkhouse_powered_torch_on_floor.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="barkhouse_powered_torch_on_ceiling.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="barkhouse_powered_torch.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1},
	legacy_wallmounted = true,
})
