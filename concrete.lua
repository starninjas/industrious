--
-- Concrete
--

--- SOUNDS

local concrete_sound = default.node_sound_stone_defaults({
	footstep = {name = "industrious_concrete_footstep", gain = 0.15, pitch = 0.9},
	dig = {name = "industrious_concrete_footstep", gain = 0.4, pitch = 1.1},
	dug = {name = "industrious_concrete_dug", gain = 0.37},
})

--- CONCRETE

-- Concrete

minetest.register_node("industrious:concrete", {
	description = "Concrete",
	tiles = {"industrious_concrete.png"},
	groups = {cracky = 2},
	sounds = concrete_sound,
	drops = "industrious:concrete_powder"
})

minetest.register_craft({
	output = "industrious:concrete 8",
	recipe = {
		{"industrious:concrete_powder", "industrious:concrete_powder", "industrious:concrete_powder"},
		{"industrious:concrete_powder", "bucket:bucket_water", "industrious:concrete_powder"},
		{"industrious:concrete_powder", "industrious:concrete_powder", "industrious:concrete_powder"},
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

-- Concrete Powder

minetest.register_node("industrious:concrete_powder", {
	description = "Concrete Powder",
	tiles = {"industrious_concrete_powder.png"},
	groups = {oddly_breakable_by_hand = 1, falling_node = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_craft({
	output = "industrious:concrete_powder 4",
	recipe = {
		{"group:sand", "default:gravel"},
		{"default:gravel", "group:sand"},
	}
})

-- Concrete with Caution Tape

minetest.register_node("industrious:concrete_caution", {
	description = "Concrete with Caution Tape",
	tiles = {
		"industrious_concrete_painted_top.png", "industrious_concrete_slab.png",
		"industrious_concrete_painted_side.png", "industrious_concrete_painted_side.png",
		"industrious_concrete_painted_side.png",
		},
	groups = {cracky = 2},
	sounds = concrete_sound,
	drops = "industrious:concrete_powder"
})

minetest.register_craft({
	output = "industrious:concrete_caution 4",
	recipe = {
		{"industrious:concrete", "industrious:concrete", "dye:black"},
		{"industrious:concrete", "industrious:concrete", "dye:yellow"},
	}
})

-- Concrete Slab

minetest.register_node("industrious:concrete_slab", {
	description = "Concrete Slab",
	drawtype = "nodebox",
	tiles = {"industrious_concrete_slab.png"},
	paramtype = "light",
	groups = {cracky = 2},
	sounds = concrete_sound,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, 0.5000, 0.000, 0.5000},
		},
	},
})

minetest.register_craft({
	output = "industrious:concrete_slab 6",
	recipe = {
		{"industrious:concrete", "industrious:concrete", "industrious:concrete"},
	}
})

-- Concrete Block

minetest.register_node("industrious:concrete_block", {
	description = "Concrete Block",
	drawtype = "nodebox",
	inventory_image = "industrious_concrete_block.png",
	tiles = {
		"industrious_concrete_block_top.png", "industrious_concrete_block_top.png",
		"industrious_concrete.png", "industrious_concrete.png",
		"industrious_concrete.png",
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2, falling_node = 1},
	sounds = concrete_sound,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2500, -0.5000, -0.5000, 0.2500, 0.000, 0.5000},
		},
	},
})

minetest.register_craft({
	output = "industrious:concrete_block 16",
	recipe = {
		{"industrious:concrete", "industrious:concrete"},
		{"industrious:concrete", "industrious:concrete"},
	}
})

minetest.register_node("industrious:concrete_block_wall", {
	description = "Concrete Block Wall",
	tiles = {
		"industrious_concrete_block_wall_top.png", "industrious_concrete_block_wall_top.png",
		"industrious_concrete_block_wall_side.png", "industrious_concrete_block_wall_side.png",
		"industrious_concrete_block_wall_side.png",
		},
	groups = {cracky = 2},
	sounds = concrete_sound,
})

minetest.register_craft({
	output = "industrious:concrete_block_wall 1",
	recipe = {
		{"industrious:concrete_block", "industrious:concrete_block"},
		{"industrious:concrete_block", "industrious:concrete_block"},
	}
})

-- Concrete Brick

minetest.register_craftitem("industrious:concrete_brick", {
	description = "Concrete Brick",
	inventory_image = "industrious_concrete_brick.png",
})

minetest.register_craft({
	output = "industrious:concrete_brick 4",
	recipe = {
		{"industrious:concrete"},
	}
})

minetest.register_node("industrious:concrete_brick_wall", {
	description = "Concrete Brick Wall",
	tiles = {"industrious_concrete_brick_wall.png"},
	groups = {cracky = 2},
	sounds = concrete_sound,
})

minetest.register_craft({
	output = "industrious:concrete_brick_wall 1",
	recipe = {
		{"industrious:concrete_brick", "industrious:concrete_brick"},
		{"industrious:concrete_brick", "industrious:concrete_brick"},
	}
})