--[[	
________      _____ __________ ____  __.  _________
\______ \    /  _  \\______   \    |/ _| /   _____/
 |    |  \  /  /_\  \|       _/      <   \_____  \ 
 |    `   \/    |    \    |   \    |  \  /        \
/_______  /\____|__  /____|_  /____|__ \/_______  /
        \/         \/       \/        \/        \/ 
]]--

--- Checking for translation

local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

--- Checking for 3D Armor/Shields

if minetest.get_modpath("3d_armor") then
	dofile(minetest.get_modpath("darks").."/darks_armor.lua")
end

if minetest.get_modpath("shields") then
	dofile(minetest.get_modpath("darks").."/darks_shields.lua")
end

--- Overriding Obsidian

minetest.override_item("default:obsidian", {drop = {
    max_items = 1,
    items = {
			{items = {'darks:darksubstance'}, 
				rarity = tonumber(minetest.settings:get("darksubstance_rarity")), -- default set to 50
				tools = {'default:pick_mese', 'default:pick_diamond', 'darks:darkpick', 'ethereal:pick_crystal'}},
            {items = {'default:obsidian'}},
            }
}})

--- Registering Items/Tools

minetest.register_craftitem("darks:darksubstance", {
    description = S("Dark Subsance"),
    inventory_image = "darksubstance.png",
    tiles = "darksubstance.png",
	groups = {not_in_creative_inventory=1},
	is_visible = false,
	initial_properties = {time_to_live = 2},
	range = 7,
})

minetest.register_node("darks:darkblock", {
	description = S("Dark Block"),
	tiles = {"darkblock.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory=1, cracky=2, level=5},
})

minetest.register_node("darks:darkblock_r", {
	description = S("Dark Block Reinforced"),
	tiles = {"darkblock_r.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory=1, cracky=1, level=5},
})

minetest.register_tool("darks:darksword", {
	description = S("Dark Sword"),
	inventory_image = "darksword.png",
	groups = {not_in_creative_inventory=1},
	range = 7,
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.70, [2]=0.70, [3]=0.25}, uses=70, maxlevel=5},
		},
		damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("darks:darkpick", {
    description = S("Dark Pickaxe"),
	inventory_image = "darkpick.png",
	groups = {not_in_creative_inventory=1},
	range = 7,
    tool_capabilities = {
        full_punch_interval = 0.8,
		max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.80, [2]=0.80, [3]=0.40}, uses=70, maxlevel=5}
        },
        damage_groups = {fleshy=7},
       },
    sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("darks:darkaxe", {
    description = S("Dark Axe"),
	inventory_image = "darkaxe.png",
	groups = {not_in_creative_inventory=1},
	range = 7,
    tool_capabilities = {
        full_punch_interval = 0.7,
		max_drop_level=3,
        groupcaps={
			choppy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=70, maxlevel=5},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("darks:darkshovel", {
	description = S("Dark Shovel"),
	inventory_image = "darkshovel.png",
	wield_image = "darkshovel.png^[transformR90",
	groups = {not_in_creative_inventory=1},
	range = 7,
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=70, maxlevel=5},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

if minetest.get_modpath("farming") then
    farming.register_hoe("darks:darkhoe", {
		description = S("Dark Hoe"),
		inventory_image = "darkhoe.png",
		max_uses = 1000,
		groups = {not_in_creative_inventory = 1},
		range = 7,
		damage_groups = {fleshy=7},
	})
	
end

minetest.register_tool("darks:darkstick", {
	description = S("Dark Stick"),
	inventory_image = "darkstick.png",
	wield_image = "darkstick.png^[transformR90",
	groups = {not_in_creative_inventory=1},
	range = 10,
	tool_capabilities = {
		full_punch_interval = 10.0,
		max_drop_level=1,
		groupcaps={
			snappy={uses=70},
		},
		damage_groups = {fleshy=1},
	},
	sound = {breaks = "default_tool_breaks"},
	on_use = function(itemstack, player, pointed_thing)
		if pointed_thing.above == nil then
			return
		end
			minetest.add_particlespawner({
				amount = 1000,
				time = 7,
				minpos = {x = tonumber(pointed_thing.above.x)+5, y = tonumber(pointed_thing.above.y), z = tonumber(pointed_thing.above.z)+5},
				maxpos = {x = tonumber(pointed_thing.above.x)-5, y = tonumber(pointed_thing.above.y), z = tonumber(pointed_thing.above.z)-5},
				minvel = {x = -0, y = 0, z = -0},
				maxvel = {x = 3, y = 3, z = 3},
				minacc = {x = 1, y = 1, z = 1},
				maxacc = {x = -1, y = -1, z = -1},
				minexptime = 5,
				maxexptime = 10,
				minsize = 5,
				maxsize = 20,
				texture = "darkness.png",
				collisiondetection = false
			})
		end,

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

minetest.register_craft({
	output = "darks:darkstick 1",
	recipe = {
		{"", "", "darks:darksubstance"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", ""}
	}
})

minetest.register_craft({
	output = "darks:darkblock",
	recipe = {
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
	}
})

minetest.register_craft({
	output = "darks:darksubstance 9",
	recipe = {
		{"darks:darkblock"},
	}
})

minetest.register_craft({
	output = "darks:darkblock_r",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "darks:darkblock", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "darks:darkblock",	
	recipe = {
		{"darks:darkblock_r"},
	}
})
