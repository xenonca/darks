--- Registering Items/Tools

minetest.register_craftitem("darks:darksubstance", {
    description = "Dark Subsance",
    inventory_image = "darksubstance.png",
    tiles = "darksubstance.png",
    groups = {not_in_creative_inventory=1},
})

minetest.override_item("default:obsidian", {drop = {
    max_items = 1,
    items = {
            {items = {'darks:darksubstance'}, rarity = 50},
            {items = {'default:obsidian'}},
            }
}})


minetest.register_tool("darks:darksword", {
	description = "Dark Sword",
	inventory_image = "darksword.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.90, [2]=0.30, [3]=0.10}, uses=50, maxlevel=5},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("darks:darkpick", {
    description = "Dark Pickaxe",
    inventory_image = "darkpick.png",
    tool_capabilities = {
        full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=0.10}, uses=100, maxlevel=5}
        },
        damage_groups = {fleshy=7},
       },
    sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("darks:darkaxe", {
    description = "Dark Axe",
    inventory_image = "darkaxe.png",
    tool_capabilities = {
        full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps={
			choppy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=100, maxlevel=5},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})
--- Registering Recipes

minetest.register_craft({
	output = "darks:darksword 1",
	recipe = {
		{"darks:darksubstance"},
		{"darks:darksubstance"},
		{"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "darks:darkpick 1",
	recipe = {
		{"darks:darksubstance","darks:darksubstance","darks:darksubstance"},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})

minetest.register_craft({
	output = "darks:darkaxe 1",
	recipe = {
		{"darks:darksubstance","darks:darksubstance",""},
		{"darks:darksubstance","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})
