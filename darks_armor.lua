--- Registering Armor

minetest.register_tool("darks:dark_chestplate", {
	description = "Dark Chestplate",
	inventory_image = "3d_armor_chestplate_dark.png",
    groups = {armor_torso=1, armor_heal=18, armor_use=20, armor_fire=1, not_in_creative_inventory=1},
    armor_groups = {fleshy =20},
    damage_groups = {cracky=2, snappy=1, level=3},
    wear = 0,
})

minetest.register_tool("darks:dark_leggings", {
	description = "Dark Leggings",
	inventory_image = "3d_armor_leggings_dark.png",
    groups = {armor_legs=1, armor_heal=18, armor_use=20, armor_fire=1, not_in_creative_inventory=1},
    armor_groups = {fleshy =20},
    damage_groups = {cracky=2, snappy=1, level=3},
    wear = 0,
})

minetest.register_tool("darks:dark_boots", {
	description = "Dark Boots",
	inventory_image = "3d_armor_boots_dark.png",
    groups = {armor_feet=1, armor_heal=18, armor_use=20,
        physics_speed=1.5, physics_jump=1, armor_fire=1, armor_fire=1, not_in_creative_inventory=1},
    armor_groups = {fleshy =15},
    damage_groups = {cracky=2, snappy=1, level=3},
    wear = 0,
})

minetest.register_tool("darks:dark_helmet", {
	description = "Dark Helmet",
	inventory_image = "3d_armor_helmet_dark.png",
    groups = {armor_head=1, armor_heal=18, armor_use=20, armor_fire=1, not_in_creative_inventory=1},
    armor_groups = {fleshy =15},
    damage_groups = {cracky=2, snappy=1, level=3},
    wear = 0,
})


--- Registering Recipes

minetest.register_craft({
	output = "darks:dark_chestplate",
	recipe = {
		{"darks:darksubstance", "", "darks:darksubstance"},
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
	},
})

minetest.register_craft({
	output = "darks:dark_leggings",
	recipe = {
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "", "darks:darksubstance"},
		{"darks:darksubstance", "", "darks:darksubstance"},
	},
})

minetest.register_craft({
	output = "darks:dark_boots",
	recipe = {
		{"darks:darksubstance", "", "darks:darksubstance"},
		{"darks:darksubstance", "", "darks:darksubstance"},
	},
})

minetest.register_craft({
	output = "darks:dark_helmet",
	recipe = {
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "", "darks:darksubstance"},
		{"", "", ""},
	},
})