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

minetest.register_tool("darks:darkshovel", {
	description = "Dark Shovel",
	inventory_image = "darkshovel.png",
	wield_image = "darkshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.00, [2]=0.40, [3]=0.20}, uses=100, maxlevel=5},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

if minetest.get_modpath("farming") then
    farming.register_hoe("darks:darkhoe", {
		description = "Dark Hoe",
		inventory_image = "darkhoe.png",
		max_uses = 1000,
		groups = {not_in_creative_inventory = 1},
		damage_groups = {fleshy=7},
	})
	
    end

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

minetest.register_craft({
	output = "darks:darkshovel 1",
	recipe = {
		{"", "darks:darksubstance", ""},
		{"", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""}
	}
})

minetest.register_craft({
	output = "darks:darkhoe 1",
	recipe = {
		{"darks:darksubstance", "darks:darksubstance", ""},
		{"", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""}
	}
})