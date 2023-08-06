industrious = {}

local S = default.get_translator

--
-- Metal Variations
--

--- TRAPDOORS

if minetest.get_modpath("doors") then

-- Tin

doors.register_trapdoor("industrious:trapdoor_tin", {
	description = "Tin Trapdoor",
	inventory_image = "industrious_trapdoor_tin.png",
	wield_image = "industrious_trapdoor_tin.png",
	tile_front = "industrious_trapdoor_tin.png",
	tile_side = "industrious_trapdoor_tin.png",
	protected = false,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	gain_open = 0.2,
	gain_close = 0.2,
	groups = {cracky = 1, level = 1, door = 1},
})

minetest.register_craft({
	output = "industrious:trapdoor_tin",
	recipe = {
		{"default:tin_ingot", "default:tin_ingot"},
		{"default:tin_ingot", "default:tin_ingot"},
	}
})

-- Copper

doors.register_trapdoor("industrious:trapdoor_copper", {
	description = "Copper Trapdoor",
	inventory_image = "industrious_trapdoor_copper.png",
	wield_image = "industrious_trapdoor_copper.png",
	tile_front = "industrious_trapdoor_copper.png",
	tile_side = "industrious_trapdoor_copper.png",
	protected = false,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	gain_open = 0.2,
	gain_close = 0.2,
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = "industrious:trapdoor_copper",
	recipe = {
		{"default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot"},
	}
})

-- Bronze

doors.register_trapdoor("industrious:trapdoor_bronze", {
	description = "Bronze Trapdoor",
	inventory_image = "industrious_trapdoor_bronze.png",
	wield_image = "industrious_trapdoor_bronze.png",
	tile_front = "industrious_trapdoor_bronze.png",
	tile_side = "industrious_trapdoor_bronze.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	gain_open = 0.2,
	gain_close = 0.2,
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = "industrious:trapdoor_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot"},
	}
})

-- Gold

doors.register_trapdoor("industrious:trapdoor_gold", {
	description = "Gold Trapdoor",
	inventory_image = "industrious_trapdoor_gold.png",
	wield_image = "industrious_trapdoor_gold.png",
	tile_front = "industrious_trapdoor_gold.png",
	tile_side = "industrious_trapdoor_gold.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	gain_open = 0.2,
	gain_close = 0.2,
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = "industrious:trapdoor_gold",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot"},
	}
})

--- DOORS

-- Tin

doors.register("door_tin", {
		tiles = {{name = "doors_door_tin.png", backface_culling = true}},
		description = "Tin Door",
		inventory_image = "industrious_doors_item_tin.png",
		protected = false,
		groups = {node = 1, cracky = 1, level = 1},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		gain_open = 0.2,
		gain_close = 0.2,
		recipe = {
			{"default:tin_ingot", "default:tin_ingot"},
			{"default:tin_ingot", "default:tin_ingot"},
			{"default:tin_ingot", "default:tin_ingot"},
		}
})

-- Copper

doors.register("door_copper", {
		tiles = {{name = "doors_door_copper.png", backface_culling = true}},
		description = "Copper Door",
		inventory_image = "industrious_doors_item_copper.png",
		protected = false,
		groups = {node = 1, cracky = 1, level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		gain_open = 0.2,
		gain_close = 0.2,
		recipe = {
			{"default:copper_ingot", "default:copper_ingot"},
			{"default:copper_ingot", "default:copper_ingot"},
			{"default:copper_ingot", "default:copper_ingot"},
		}
})

-- Bronze

doors.register("door_bronze", {
		tiles = {{name = "doors_door_bronze.png", backface_culling = true}},
		description = "Bronze Door",
		inventory_image = "industrious_doors_item_bronze.png",
		protected = true,
		groups = {node = 1, cracky = 1, level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		gain_open = 0.2,
		gain_close = 0.2,
		recipe = {
			{"default:bronze_ingot", "default:bronze_ingot"},
			{"default:bronze_ingot", "default:bronze_ingot"},
			{"default:bronze_ingot", "default:bronze_ingot"},
		}
})


-- Gold

doors.register("door_gold", {
		tiles = {{name = "doors_door_gold.png", backface_culling = true}},
		description = "Gold Door",
		inventory_image = "industrious_doors_item_gold.png",
		protected = true,
		groups = {node = 1, cracky = 1, level = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		gain_open = 0.2,
		gain_close = 0.2,
		recipe = {
			{"default:gold_ingot", "default:gold_ingot"},
			{"default:gold_ingot", "default:gold_ingot"},
			{"default:gold_ingot", "default:gold_ingot"},
		}
})

end

--- BARS

if minetest.get_modpath("xpanes") then

-- Tin

xpanes.register_pane("tin_bar", {
	description = "Tin Bars",
	textures = {"industrious_bar_tin.png", "", "default_tin_block.png"},
	inventory_image = "industrious_bar_tin.png",
	wield_image = "industrious_bar_tin.png",
	groups = {cracky=3},
	sounds = default.node_sound_metal_defaults(),
	recipe = {
		{"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"},
		{"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"}
	}
})

-- Copper

xpanes.register_pane("copper_bar", {
	description = "Copper Bars",
	textures = {"industrious_bar_copper.png", "", "default_copper_block.png"},
	inventory_image = "industrious_bar_copper.png",
	wield_image = "industrious_bar_copper.png",
	groups = {cracky=3, level=2},
	sounds = default.node_sound_metal_defaults(),
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"}
	}
})


-- Bronze

xpanes.register_pane("bronze_bar", {
	description = "Bronze Bars",
	textures = {"industrious_bar_bronze.png", "", "default_bronze_block.png"},
	inventory_image = "industrious_bar_bronze.png",
	wield_image = "industrious_bar_bronze.png",
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"}
	}
})

-- Gold

xpanes.register_pane("gold_bar", {
	description = "Gold Bars",
	textures = {"industrious_bar_gold.png", "", "default_gold_block.png"},
	inventory_image = "industrious_bar_gold.png",
	wield_image = "industrious_bar_gold.png",
	groups = {cracky=3, level=2},
	sounds = default.node_sound_metal_defaults(),
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"}
	}
})

end

--- LADDERS

-- Tin

minetest.register_node("industrious:ladder_tin", {
	description = "Tin Ladder",
	drawtype = "signlike",
	tiles = {"industrious_ladder_tin.png"},
	inventory_image = "industrious_ladder_tin.png",
	wield_image = "industrious_ladder_tin.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 3},
	sounds = default.node_sound_metal_defaults(),
})

-- Copper

minetest.register_node("industrious:ladder_copper", {
	description = "Copper Ladder",
	drawtype = "signlike",
	tiles = {"industrious_ladder_copper.png"},
	inventory_image = "industrious_ladder_copper.png",
	wield_image = "industrious_ladder_copper.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 3, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

-- Bronze

minetest.register_node("industrious:ladder_bronze", {
	description = "Bronze Ladder",
	drawtype = "signlike",
	tiles = {"industrious_ladder_bronze.png"},
	inventory_image = "industrious_ladder_bronze.png",
	wield_image = "industrious_ladder_bronze.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
})

-- Gold

minetest.register_node("industrious:ladder_gold", {
	description = "Gold Ladder",
	drawtype = "signlike",
	tiles = {"industrious_ladder_gold.png"},
	inventory_image = "industrious_ladder_gold.png",
	wield_image = "industrious_ladder_gold.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 3, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


--- SIGNS

local function register_sign(material, desc, def)
	minetest.register_node("industrious:sign_wall_" .. material, {
		description = desc,
		drawtype = "nodebox",
		tiles = {"industrious_sign_wall_" .. material .. ".png"},
		inventory_image = "industrious_sign_" .. material .. ".png",
		wield_image = "industrious_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		use_texture_alpha = "opaque",
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local text = fields.text
			if not text then
				return
			end
			if string.len(text) > 512 then
				minetest.chat_send_player(player_name, "Text too long")
				return
			end

			local meta = minetest.get_meta(pos)
			meta:set_string("text", text)

			if #text > 0 then
					meta:set_string("infotext", S('"@1"', text))
			else
				meta:set_string("infotext", '')
			end
		end,
	})
end

-- Tin

register_sign("tin", "Tin Sign", {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 3, attached_node = 1}
})

-- Copper

register_sign("copper", "Copper Sign", {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 3, level = 2, attached_node = 1}
})

-- Bronze

register_sign("bronze", "Bronze Sign", {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 2, attached_node = 1}
})

-- Gold

register_sign("gold", "Gold Sign", {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 3, level = 2, attached_node = 1}
})

--- METAL CONTAINERS

-- Tin

minetest.register_node("industrious:tin_can", {
	description = "Empty Tin Can",
	drawtype = "plantlike",
	tiles = {"industrious_tin_can.png"},
	inventory_image = "industrious_tin_can.png",
	wield_image = "industrious_tin_can.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "industrious:tin_can 5",
	recipe = {
		{"default:tin_ingot", "", "default:tin_ingot"},
		{"default:tin_ingot", "", "default:tin_ingot"},
		{"", "default:tin_ingot", ""}
	}
})

minetest.register_craft( {
	type = "cooking",
	output = "default:tin_ingot",
	recipe = "industrious:tin_can",
})

-- Copper

minetest.register_node("industrious:copper_container", {
	description = "Empty Copper Container",
	drawtype = "plantlike",
	tiles = {"industrious_copper_container.png"},
	inventory_image = "industrious_copper_container.png",
	wield_image = "industrious_copper_container.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "industrious:copper_container 5",
	recipe = {
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"", "default:copper_ingot", ""}
	}
})

minetest.register_craft( {
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "industrious:copper_container",
})


-- Bronze

minetest.register_node("industrious:bronze_bottle", {
	description = "Heavy Empty Bronze Bottle",
	drawtype = "plantlike",
	tiles = {"industrious_bronze_bottle.png"},
	inventory_image = "industrious_bronze_bottle.png",
	wield_image = "industrious_bronze_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "industrious:bronze_bottle 5",
	recipe = {
		{"default:bronze_ingot", "", "default:bronze_ingot"},
		{"default:bronze_ingot", "", "default:bronze_ingot"},
		{"", "default:bronze_ingot", ""}
	}
})

minetest.register_craft( {
	type = "cooking",
	output = "default:bronze_ingot",
	recipe = "industrious:bronze_bottle",
})

-- Gold

minetest.register_node("industrious:gold_goblet", {
	description = "Empty Gold Goblet",
	drawtype = "plantlike",
	tiles = {"industrious_gold_goblet.png"},
	inventory_image = "industrious_gold_goblet.png",
	wield_image = "industrious_gold_goblet.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "industrious:gold_goblet 5",
	recipe = {
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "default:gold_ingot", ""}
	}
})

minetest.register_craft( {
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "industrious:gold_goblet",
})

