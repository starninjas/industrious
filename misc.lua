--
-- Misc Nodes
--

--- ASPHALT

-- Tar

minetest.register_craftitem("industrious:tar", {
	description = "Tar",
	inventory_image = "industrious_tar.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "industrious:tar 2",
	recipe = "default:pine_wood",
})

minetest.register_craft({
	type = "cooking",
	output = "industrious:tar 7",
	recipe = "default:pine_tree",
})

-- Asphalt

minetest.register_node("industrious:asphalt", { --TODO: Make it so walking on asphalt makes you move faster
	description = "Asphalt",
	tiles = {"industrious_asphalt.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "industrious:asphalt",
	recipe = {
		{"industrious:tar", "default:gravel"},
	}
})

minetest.register_craft({
	output = "industrious:asphalt",
	recipe = {
		{"industrious:tar", "industrious:desert_gravel"},
	}
})

--- DIAMOND/TREAD PLATE

minetest.register_node("industrious:diamond_plate", {
	description = "Diamond Plate",
	tiles = {"industrious_diamond_plate.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_metal_defaults(),

	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.45, 0.5}
	},

})

minetest.register_craft({
	output = "industrious:diamond_plate 4",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})


--- ENCASED MESE LIGHT

minetest.register_node("industrious:mese_light", {
	description = "Encased Mese Light",
	drawtype = "glasslike",
	tiles = {"default_meselamp.png^xpanes_bar.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
	light_source = 15,
})

minetest.register_craft({
	output = "industrious:mese_light",
	recipe = {
		{"", "xpanes:bar", ""},
		{"xpanes:bar", "default:mese_lamp", "xpanes:bar"},
		{"", "xpanes:bar", ""},
	}
})

--- PRIVACY GLASS

minetest.register_node("industrious:privacy_glass", {
	description = "Privacy Glass",
	drawtype = "glasslike",
	tiles = {"industrious_privacy_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
        use_texture_alpha = "blend",
	groups = {cracky = 2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "industrious:privacy_glass 2",
	recipe = {
		{"default:glass", "default:ice"},
		{"default:ice", "default:glass"},
	}
})

--- LOG WALLS

if minetest.get_modpath("walls") then

walls.register("industrious:apple_wall", "Apple Log Wall", {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
		"default:tree", default.node_sound_wood_defaults())

walls.register("industrious:jungle_wall", "Jungle Log Wall", {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
		"default:jungletree", default.node_sound_wood_defaults())

walls.register("industrious:pine_wall", "Pine Log Wall", {"default_pine_tree_top.png", "default_pine_tree_top.png", "default_pine_tree.png"},
		"default:pine_tree", default.node_sound_wood_defaults())

walls.register("industrious:acacia_wall", "Acacia Log Wall", {"default_acacia_tree_top.png", "default_acacia_tree_top.png", "default_acacia_tree.png"},
		"default:acacia_tree", default.node_sound_wood_defaults())

walls.register("industrious:aspen_wall", "Aspen Log Wall", {"default_aspen_tree_top.png", "default_aspen_tree_top.png", "default_aspen_tree.png"},
		"default:acacia_tree", default.node_sound_wood_defaults())


end

--
-- Quality of Life Changes
--

--- FIXES

-- Blast-proof Obsidian

minetest.override_item("default:obsidian", {
	on_blast = function() end,
})

minetest.override_item("default:obsidianbrick", {
	on_blast = function() end,
})

minetest.override_item("default:obsidian_block", {
	on_blast = function() end,
})

-- Craftable Desert Sand

minetest.register_craft({
	output = "default:desert_sand",
	recipe = {
		{"default:sand", "default:clay_lump"}
	},
})

--- ICE BRICK/BLOCK

minetest.register_node("industrious:ice_brick", {
	description = "Ice Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	paramtype = "light",
	tiles = {"industrious_ice_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_node("industrious:ice_block", {
	description = "Ice Block",
	paramtype = "light",
	tiles = {"industrious_ice_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_ice_defaults(),
})

--carfting

minetest.register_craft({
	output = "industrious:ice_brick 4",
	recipe = {
		{"default:ice", "default:ice"},
		{"default:ice", "default:ice"},
	}
})

minetest.register_craft({
	output = "industrious:ice_block 9",
	recipe = {
		{"default:ice", "default:ice", "default:ice"},
		{"default:ice", "default:ice", "default:ice"},
		{"default:ice", "default:ice", "default:ice"},
	}
})
