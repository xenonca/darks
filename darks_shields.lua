--- Checking Translation

local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

--- Registering Shield

minetest.register_tool("darks:dark_shield", {
	description = S("Dark Shield"),
	inventory_image = "shields_shield_dark.png",
    groups = {armor_shield=1, armor_heal=19, armor_use=20, armor_fire=1, not_in_creative_inventory=1},
    armor_groups = {fleshy=20},
    wear = 0,
})

--- Registering Recipe

minetest.register_craft({
	output = "darks:dark_shield",
	recipe = {
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"darks:darksubstance", "darks:darksubstance", "darks:darksubstance"},
		{"", "darks:darksubstance", ""},
	},
})
