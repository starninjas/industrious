--
-- Gravel Variants
--

--- DESERT GRAVEL

minetest.register_node("industrious:desert_gravel", {
	description = "Desert Gravel",
	tiles = {"industrious_desert_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {"default:flint"}, rarity = 14},
			{items = {"default:iron_lump"}, rarity = 18},
			{items = {"industrious:desert_gravel"}}
		}
	}
})

--mapgen
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "industrious:desert_gravel",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 17 * 17 * 17,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

--- MINERAL-RICH GRAVEL

minetest.register_node("industrious:mineral_gravel", {
	description = "Mineral-Rich Gravel",
	tiles = {"industrious_mineral_gravel.png"},
	groups = {crumbly = 1, falling_node = 1, not_in_inventory = 1},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {"default:flint"}, rarity = 8},
			{items = {"default:iron_lump 2"}, rarity = 7},
			{items = {"default:iron_lump"}, rarity = 3},
			{items = {"default:tin_lump"}, rarity = 5},
			{items = {"default:gold_lump"}, rarity = 30},
			{items = {"default:copper_lump"}, rarity = 4},
			{items = {"default:gravel"}, rarity = 2}
		}
	}
})

--mapgen
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "industrious:mineral_gravel",
		wherein         = {"default:stone"},
		clust_scarcity  = 24 * 24 * 24,
		clust_size      = 4,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

--
-- Mining Variants
--


--- COAL WITH DIAMOND

minetest.register_node("industrious:coal_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_coal_block.png^default_mineral_diamond.png"},
	groups = {cracky = 1, not_in_inventory = 1},
	drop = {
		max_items = 3,
		items = {
			{items = {"default:diamond 1"}},
			{items = {"default:coal_lump 3"}, rarity=2},
			{items = {"default:coal_lump 5"}, rarity=3},
			{items = {"default:coal_lump 1"}, rarity=1},
			{items = {"default:coal_lump 2"}, rarity=2},
			{items = {"default:coal_lump 7"}, rarity=5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

-- Mapgen

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "industrious:coal_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 50 * 50 * 50,
	clust_num_ores = 6,
	clust_size     = 4,
	y_max          = -5000,
	y_min          = -31000,
})

--
-- Raw Ore Blocks
--

--- TIN

minetest.register_node("industrious:tin_block", {
	description = "Raw Tin Block",
	tiles = {"industrious_tin_block.png"},
	groups = {cracky = 1, level = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:tin_lump 7"}, rarity=1},
			{items = {"default:tin_lump 8"}, rarity=2},
			{items = {"default:tin_lump 9"}, rarity=3},
		},
	},
	sounds = default.node_sound_metal_defaults(),
})

-- Mapgen

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "industrious:tin_block",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = -3000,
	y_min          = -31000,
})

-- Crafting

minetest.register_craft({
	output = "indutrious:tin_block",
	recipe = {
		{"default:tin_lump", "default:tin_lump", "default:tin_lump"},
		{"default:tin_lump", "default:tin_lump", "default:tin_lump"},
		{"default:tin_lump", "default:tin_lump", "default:tin_lump"},
	}
})

--- IRON

minetest.register_node("industrious:iron_block", {
	description = "Raw Iron Block",
	tiles = {"industrious_iron_block.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:iron_lump 7"}, rarity=1},
			{items = {"default:iron_lump 8"}, rarity=2},
			{items = {"default:iron_lump 9"}, rarity=3},
		},
	},
	sounds = default.node_sound_metal_defaults(),
})

-- Mapgen

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "industrious:iron_block",
	wherein        = "default:stone",
	clust_scarcity = 30 * 30 * 30,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = -3000,
	y_min          = -31000,
})

-- Crafting

minetest.register_craft({
	output = "indutrious:iron_block",
	recipe = {
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
	}
})

--- COPPER

minetest.register_node("industrious:copper_block", {
	description = "Raw Copper Block",
	tiles = {"industrious_copper_block.png"},
	groups = {cracky = 3, level = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:copper_lump 7"}, rarity=1},
			{items = {"default:copper_lump 8"}, rarity=2},
			{items = {"default:copper_lump 9"}, rarity=3},
		},
	},
	sounds = default.node_sound_metal_defaults(),
})

-- Mapgen

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "industrious:copper_block",
	wherein        = "default:stone",
	clust_scarcity = 37 * 37 * 37,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = -3500,
	y_min          = -31000,
})

-- Crafting

minetest.register_craft({
	output = "indutrious:copper_block",
	recipe = {
		{"default:copper_lump", "default:copper_lump", "default:copper_lump"},
		{"default:copper_lump", "default:copper_lump", "default:copper_lump"},
		{"default:copper_lump", "default:copper_lump", "default:copper_lump"},
	}
})

--- GOLD

minetest.register_node("industrious:gold_block", {
	description = "Raw Gold Block",
	tiles = {"industrious_gold_block.png"},
	groups = {cracky = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:gold_lump 7"}, rarity=1},
			{items = {"default:gold_lump 8"}, rarity=2},
			{items = {"default:gold_lump 9"}, rarity=3},
		},
	},
	sounds = default.node_sound_metal_defaults(),
})

-- Mapgen

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "industrious:gold_block",
	wherein        = "default:stone",
	clust_scarcity = 40 * 40 * 40,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max          = -5000,
	y_min          = -31000,
})

-- Crafting

minetest.register_craft({
	output = "indutrious:gold_block",
	recipe = {
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
	}
})


--- DESERT VARIANTS

-- Coal

minetest.register_node("industrious:desert_stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_desert_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3, not_in_inventory = 1},
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- Gold

minetest.register_node("industrious:desert_stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_desert_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2, not_in_inventory = 1},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- Mapgen

	--coal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 9,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -127,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 30,
		clust_size     = 5,
		y_max          = -128,
		y_min          = -31000,
	})

	--gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:desert_stone_with_gold",
		wherein        = "default:desert_stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:desert_stone_with_gold",
		wherein        = "default:desert_stone",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 29,
		clust_size     = 5,
		y_max          = -256,
		y_min          = -31000,
	})

	--iron block

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:iron_block",
		wherein        = "default:desert_stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:iron_block",
		wherein        = "default:desert_stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -128,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "industrious:iron_block",
		wherein        = "default:desert_stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -256,
		y_min          = -31000,
	})

