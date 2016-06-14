-- Recipes for Vinegar
minetest.register_craft({
	output = "barkhouse:vinegar",
	recipe = {
		{"food:rainbow_juice"},
	},
})
minetest.register_craft({
	output = "barkhouse:vinegar",
	recipe = {
		{"food:orange_juice"},
	},
})
minetest.register_craft({
	output = "barkhouse:vinegar",
	recipe = {
		{"food:apple_juice"},
	},
})
minetest.register_craft({
	output = "barkhouse:vinegar",
	recipe = {
		{"food:rainbow_juice"},
	},
})

-- Recipe for Iron Floor
minetest.register_craft({
	output = "barkhouse:iron_bar_floor 3",
	recipe = {
		{"xpanes:bar", "xpanes:bar", "xpanes:bar",},
	},
})

-- Recipe for xpanes:bar
minetest.register_craft({
	output = "xpanes:bar 3",
	recipe = {
		{"barkhouse:iron_bar_floor", "barkhouse:iron_bar_floor", "barkhouse:iron_bar_floor",},
	},
})


-- Recipe for Steel Wool
minetest.register_craft({
	output = "barkhouse:steel_wool 6",
	recipe = {
		{"default:steel_ingot"},
	},
})

-- Recipe for Steel Wool Vinegar Solution
minetest.register_craft({
	output = "barkhouse:steel_wool_vinegar_solution",
	recipe = {
		{"barkhouse:vinegar", "barkhouse:steel_wool",},
	}
})

-- Recipe for regular graywood
minetest.register_craft({
	output = "barkhouse:graywood",
	recipe = {
		{'default:wood', 'barkhouse:steel_wool_vinegar_solution',},
	}
})
-- Recipe for Light Graywood
minetest.register_craft({
	output = "barkhouse:graywood_pine",
	recipe = {
		{'default:pine_wood', 'barkhouse:steel_wool_vinegar_solution',},
	}
})
-- Recipe for Dark Graywood
minetest.register_craft({
	output = "barkhouse:graywood_jungle",
	recipe = {
		{'default:junglewood', 'barkhouse:steel_wool_vinegar_solution',},
	}
})


-- Recipe for Salt Fragments
minetest.register_craft({
	output = "barkhouse:salt_fragments 9",
	recipe = {
		{'caverealms:salt_crystal',},
	}
})

-- Recipe for Anhydrite
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "barkhouse:anhydrite",
	recipe = "barkhouse:salt_fragments",
})

-- Recipe for Plaster Block
minetest.register_craft({
	output = "barkhouse:plaster 10",
	recipe = {
		{"bucket:bucket_water", "barkhouse:anhydrite",},
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
})
