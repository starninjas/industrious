industrious = {}

--
-- Ice Picks
--

minetest.register_tool("industrious:icepick_bronze", {
	description = "Bronze Icepick",
	inventory_image = "industrious_icepick_bronze.png",
	wield_image = "industrious_icepick_bronze.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.2, [2]=2.2, [3]=1.2}, uses=5, maxlevel=3},
			slippery = {times={[3]=0.50}, uses=20, maxlevel=3},
			snowy = {times={[1]=0.60}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_dug_metal"},
	groups = {icepick = 1}
})

minetest.register_craft({
	output = "industrious:icepick_bronze",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", ""},
		{"", "default:bronze_ingot", ""},
		{"", "default:bronze_ingot", ""},
	}
})

minetest.register_tool("industrious:icepick_steel", {
	description = "Steel Icepick",
	inventory_image = "industrious_icepick_steel.png",
	wield_image = "industrious_icepick_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.2, [2]=2.2, [3]=1.2}, uses=5, maxlevel=3},
			slippery = {times={[3]=0.60}, uses=25, maxlevel=3},
			snowy = {times={[1]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_dug_metal"},
	groups = {icepick = 1}
})

minetest.register_craft({
	output = "industrious:icepick_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""},
	}
})

--
-- Spades
--

minetest.register_tool("industrious:spade_bronze", {
	description = "Bronze Spade",
	inventory_image = "industrious_spade_bronze.png",
	wield_image = "industrious_spade_bronze.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=2.65, [2]=2.05, [3]=1.45}, uses=25, maxlevel=2},
			attached_node = {times={[1]=0.2}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {spade = 1}
})

minetest.register_craft({
	output = "industrious:spade_bronze",
	recipe = {
		{"", "default:bronze_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_tool("industrious:spade_steel", {
	description = "Steel Spade",
	inventory_image = "industrious_spade_steel.png",
	wield_image = "industrious_spade_steel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=2.50, [2]=1.90, [3]=1.40}, uses=30, maxlevel=2},
			attached_node = {times={[1]=0.25}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {spade = 1}
})

minetest.register_craft({
	output = "industrious:spade_steel",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_tool("industrious:spade_mese", {
	description = "Mese Spade",
	inventory_image = "industrious_spade_mese.png",
	wield_image = "industrious_spade_mese.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=2.20, [2]=1.60, [3]=1.30}, uses=20, maxlevel=3},
			attached_node = {times={[1]=0.15}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {spade = 1}
})

minetest.register_craft({
	output = "industrious:spade_mese",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_tool("industrious:spade_diamond", {
	description = "Diamond Spade",
	inventory_image = "industrious_spade_diamond.png",
	wield_image = "industrious_spade_diamond.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=2.10, [2]=1.50, [3]=1.30}, uses=30, maxlevel=3},
			attached_node = {times={[1]=0.1}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {spade = 1}
})

minetest.register_craft({
	output = "industrious:spade_diamond",
	recipe = {
		{"", "default:diamond", ""},
		{"", "group:stick", ""},
	}
})

--
-- Hammers
--

-- Code taken from xobsidianmese by SaKeL

function industrious.add_wear(itemstack, pos)
    -- wear tool
    local wdef = itemstack:get_definition()
    itemstack:add_wear(65535 / (400 - 1))
    -- Tool break sound
    if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
        minetest.sound_play(wdef.sound.breaks, { pos = pos, gain = 0.5 })
    end

    return itemstack
end


--- STONE

-- Smashing using stone hammer

function industrious.stone_hammer(itemstack, placer, pointed_thing)
    local pt = pointed_thing

    -- check if pointing at a node
    if not pt then
        return itemstack
    end

    if pt.type ~= 'node' then
        return itemstack
    end

    local pos = minetest.get_pointed_thing_position(pointed_thing)

    if not pos then
        return itemstack
    end

    local pointed_node = minetest.get_node(pos)
    local pointed_node_def = minetest.registered_nodes[pointed_node.name]
    if pointed_node_def and pointed_node_def.on_rightclick then
        return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
    end

    local under = minetest.get_node(pt.under)
    local p = { x = pt.under.x, y = pt.under.y + 1, z = pt.under.z }
    local above = minetest.get_node(p)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return itemstack
    end

    if not minetest.registered_nodes[above.name] then
        return itemstack
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return itemstack
    end

    if minetest.is_protected(pt.under, placer:get_player_name()) then
        minetest.record_protection_violation(pt.under, placer:get_player_name())
        return itemstack
    end
	
    --- Smashable blocks..
	
	-- Stone > Cobble
    	if (under.name == 'default:stone' or under.name == 'default:stonebrick' or under.name == 'default:stone_block')
        	and under.name ~= 'default:cobble'
    	then
 		minetest.set_node(pt.under, { name = 'default:cobble' })

	-- Cobble > Gravel
    	elseif (under.name == 'default:cobble' or under.name == 'default:mossycobble')
        	and under.name ~= 'default:gravel'
    	then
        	minetest.set_node(pt.under, { name = 'default:gravel' })


	-- Gravel or Sandstone > Sand
    	elseif (under.name == 'default:gravel' or under.name == 'default:sandstone' or under.name == 'default:sandstone_brick' or under.name == 'default:sandstone_block')
        	and under.name ~= 'default:sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:sand' })


	-- Desert Sandstone > Desert Sand
    	elseif (under.name == 'default:desert_sandstone' or under.name == 'default:desert_sandstone_brick' or under.name == 'default:desert_sandstone_block')
        	and under.name ~= 'default:desert_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:desert_sand' })

	-- Silver Sandstone > Silver Sand
    	elseif (under.name == 'default:silver_sandstone' or under.name == 'default:silver_sandstone_brick' or under.name == 'default:silver_sandstone_block')
        	and under.name ~= 'default:silver_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:silver_sand' })

	end

    -- play sound
    minetest.sound_play('default_dig_cracky', {
        pos = pt.under,
        gain = 1.0,
	pitch = 0.8
    })

        itemstack = industrious.add_wear(itemstack)
   	return itemstack
end


-- Stone Hammer

minetest.register_tool('industrious:stone_hammer', {
	description = 'Stone Sledgehammer',
	inventory_image = 'industrious_hammer_stone.png',

	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60, [2]=2.00}, uses=3, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},

	sound = {breaks = 'default_tool_breaks'},
	groups = {hammer = 1},
	on_place = industrious.stone_hammer
})

minetest.register_craft({
	output = "industrious:stone_hammer",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "group:stick", "group:stone"},
		{"", "group:stick", ""},
	}
})

--- STONE

-- Smashing using stone hammer

function industrious.stone_hammer(itemstack, placer, pointed_thing)
    local pt = pointed_thing

    -- check if pointing at a node
    if not pt then
        return itemstack
    end

    if pt.type ~= 'node' then
        return itemstack
    end

    local pos = minetest.get_pointed_thing_position(pointed_thing)

    if not pos then
        return itemstack
    end

    local pointed_node = minetest.get_node(pos)
    local pointed_node_def = minetest.registered_nodes[pointed_node.name]
    if pointed_node_def and pointed_node_def.on_rightclick then
        return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
    end

    local under = minetest.get_node(pt.under)
    local p = { x = pt.under.x, y = pt.under.y + 1, z = pt.under.z }
    local above = minetest.get_node(p)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return itemstack
    end

    if not minetest.registered_nodes[above.name] then
        return itemstack
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return itemstack
    end

    if minetest.is_protected(pt.under, placer:get_player_name()) then
        minetest.record_protection_violation(pt.under, placer:get_player_name())
        return itemstack
    end
	
    --- Smashable blocks..
	
	-- Stone > Cobble
    	if (under.name == 'default:stone' or under.name == 'default:stonebrick' or under.name == 'default:stone_block')
        	and under.name ~= 'default:cobble'
    	then
 		minetest.set_node(pt.under, { name = 'default:cobble' })

	-- Cobble > Gravel
    	elseif (under.name == 'default:cobble' or under.name == 'default:mossycobble')
        	and under.name ~= 'default:gravel'
    	then
        	minetest.set_node(pt.under, { name = 'default:gravel' })


	-- Gravel or Sandstone > Sand
    	elseif (under.name == 'default:gravel' or under.name == 'default:sandstone' or under.name == 'default:sandstone_brick' or under.name == 'default:sandstone_block')
        	and under.name ~= 'default:sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:sand' })


	-- Desert Sandstone > Desert Sand
    	elseif (under.name == 'default:desert_sandstone' or under.name == 'default:desert_sandstone_brick' or under.name == 'default:desert_sandstone_block')
        	and under.name ~= 'default:desert_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:desert_sand' })

	-- Silver Sandstone > Silver Sand
    	elseif (under.name == 'default:silver_sandstone' or under.name == 'default:silver_sandstone_brick' or under.name == 'default:silver_sandstone_block')
        	and under.name ~= 'default:silver_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:silver_sand' })

	end

    -- play sound
    minetest.sound_play('default_dig_cracky', {
        pos = pt.under,
        gain = 1.0,
	pitch = 0.8
    })

        itemstack = industrious.add_wear(itemstack)
   	return itemstack
end


-- Stone Hammer

minetest.register_tool('industrious:stone_hammer', {
	description = 'Stone Sledgehammer',
	inventory_image = 'industrious_hammer_stone.png',

	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60, [2]=2.00}, uses=3, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},

	sound = {breaks = 'default_tool_breaks'},
	groups = {hammer = 1},
	on_place = industrious.stone_hammer
})

minetest.register_craft({
	output = "industrious:stone_hammer",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "group:stick", "group:stone"},
		{"", "group:stick", ""},
	}
})

--- STONE

-- Smashing using stone hammer

function industrious.stone_hammer(itemstack, placer, pointed_thing)
    local pt = pointed_thing

    -- check if pointing at a node
    if not pt then
        return itemstack
    end

    if pt.type ~= 'node' then
        return itemstack
    end

    local pos = minetest.get_pointed_thing_position(pointed_thing)

    if not pos then
        return itemstack
    end

    local pointed_node = minetest.get_node(pos)
    local pointed_node_def = minetest.registered_nodes[pointed_node.name]
    if pointed_node_def and pointed_node_def.on_rightclick then
        return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
    end

    local under = minetest.get_node(pt.under)
    local p = { x = pt.under.x, y = pt.under.y + 1, z = pt.under.z }
    local above = minetest.get_node(p)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return itemstack
    end

    if not minetest.registered_nodes[above.name] then
        return itemstack
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return itemstack
    end

    if minetest.is_protected(pt.under, placer:get_player_name()) then
        minetest.record_protection_violation(pt.under, placer:get_player_name())
        return itemstack
    end
	
    --- Smashable blocks..
	
	-- Stone > Cobble
    	if (under.name == 'default:stone')
        	and under.name ~= 'default:cobble'
    	then
 		minetest.set_node(pt.under, { name = 'default:cobble' })

	-- Cobble > Gravel
    	elseif (under.name == 'default:cobble' or under.name == 'default:mossycobble')
        	and under.name ~= 'default:gravel'
    	then
        	minetest.set_node(pt.under, { name = 'default:gravel' })


	-- Gravel or Sandstone > Sand
    	elseif (under.name == 'default:gravel' or under.name == 'default:sandstone' or under.name == 'default:sandstone_brick' or under.name == 'default:sandstone_block')
        	and under.name ~= 'default:sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:sand' })


	-- Desert Sandstone > Desert Sand
    	elseif (under.name == 'default:desert_sandstone' or under.name == 'default:desert_sandstone_brick' or under.name == 'default:desert_sandstone_block')
        	and under.name ~= 'default:desert_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:desert_sand' })

	-- Silver Sandstone > Silver Sand
    	elseif (under.name == 'default:silver_sandstone' or under.name == 'default:silver_sandstone_brick' or under.name == 'default:silver_sandstone_block')
        	and under.name ~= 'default:silver_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:silver_sand' })

	end

    -- play sound
    minetest.sound_play('default_dig_cracky', {
        pos = pt.under,
        gain = 1.0,
	pitch = 0.8
    })

        itemstack = industrious.add_wear(itemstack)
   	return itemstack
end


-- Stone Hammer

minetest.register_tool('industrious:stone_hammer', {
	description = 'Stone Sledgehammer',
	inventory_image = 'industrious_hammer_stone.png',

	tool_capabilities = {
		full_punch_interval = 3.5,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=3.00, [3]=2.00}, uses=3, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},

	sound = {breaks = 'default_tool_breaks'},
	groups = {hammer = 1},
	on_place = industrious.stone_hammer
})

minetest.register_craft({
	output = "industrious:stone_hammer",
	recipe = {
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "group:stick", "group:stone"},
		{"", "group:stick", ""},
	}
})

--- STEEL

-- Smashing using steel hammer

function industrious.steel_hammer(itemstack, placer, pointed_thing)
    local pt = pointed_thing

    -- check if pointing at a node
    if not pt then
        return itemstack
    end

    if pt.type ~= 'node' then
        return itemstack
    end

    local pos = minetest.get_pointed_thing_position(pointed_thing)

    if not pos then
        return itemstack
    end

    local pointed_node = minetest.get_node(pos)
    local pointed_node_def = minetest.registered_nodes[pointed_node.name]
    if pointed_node_def and pointed_node_def.on_rightclick then
        return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
    end

    local under = minetest.get_node(pt.under)
    local p = { x = pt.under.x, y = pt.under.y + 1, z = pt.under.z }
    local above = minetest.get_node(p)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return itemstack
    end

    if not minetest.registered_nodes[above.name] then
        return itemstack
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return itemstack
    end

    if minetest.is_protected(pt.under, placer:get_player_name()) then
        minetest.record_protection_violation(pt.under, placer:get_player_name())
        return itemstack
    end
	
    --- Smashable blocks..

	-- Concrete > Powder
    	if (under.name == 'industrious:concrete' or under.name == 'industrious:concrete_caution' or under.name ==  'industrious:concrete_brick_wall' or under.name == 'industrious:concrete_block_wall')
        	and under.name ~= 'industrious:concrete_powder'
    	then
 		minetest.set_node(pt.under, { name = 'industrious:concrete_powder' })
	
	-- Stone > Cobble
    	elseif (under.name == 'default:stone' or under.name == 'default:stonebrick' or under.name == 'default:stone_block')
        	and under.name ~= 'default:cobble'
    	then
 		minetest.set_node(pt.under, { name = 'default:cobble' })

	-- Desert Stone > Desert Cobble
    	elseif (under.name == 'default:desert_stone' or under.name == 'default:desert_stonebrick' or under.name == 'default:desert_stone_block')
        	and under.name ~= 'default:desert_cobble'
    	then
 		minetest.set_node(pt.under, { name = 'default:desert_cobble' })

	-- Cobble > Gravel
    	elseif (under.name == 'default:cobble' or under.name == 'default:mossycobble')
        	and under.name ~= 'default:gravel'
    	then
        	minetest.set_node(pt.under, { name = 'default:gravel' })


	-- Gravel or Sandstone > Sand
    	elseif (under.name == 'default:gravel' or under.name == 'default:sandstone' or under.name == 'default:sandstone_brick' or under.name == 'default:sandstone_block')
        	and under.name ~= 'default:sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:sand' })


	-- Desert Sandstone > Desert Sand
    	elseif (under.name == 'default:desert_sandstone' or under.name == 'default:desert_sandstone_brick' or under.name == 'default:desert_sandstone_block')
        	and under.name ~= 'default:desert_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:desert_sand' })

	-- Silver Sandstone > Silver Sand
    	elseif (under.name == 'default:silver_sandstone' or under.name == 'default:silver_sandstone_brick' or under.name == 'default:silver_sandstone_block')
        	and under.name ~= 'default:silver_sand'
    	then
        	minetest.set_node(pt.under, { name = 'default:silver_sand' })

	-- Soil/Brick > Clay
    	elseif (under.name == 'farming:soil_wet' or under.name == 'farming:soil' or under.name ==  'default:brick')
        	and under.name ~= 'default:clay'
    	then
 		minetest.set_node(pt.under, { name = 'default:clay' })

	-- Steel Block > Raw Iron Block
    	elseif (under.name == 'default:steelblock')
        	and under.name ~= 'industrious:iron_block'
    	then
 		minetest.set_node(pt.under, { name = 'industrious:iron_block' })

	-- Tin Block > Raw Tin Block
    	elseif (under.name == 'default:tinblock')
        	and under.name ~= 'industrious:tin_block'
    	then
 		minetest.set_node(pt.under, { name = 'industrious:tin_block' })

	-- Copper/Bronze Block > Raw Copper Block
    	elseif (under.name == 'default:copperblock' or under.name == 'default:bronzeblock')
        	and under.name ~= 'industrious:copper_block'
    	then
 		minetest.set_node(pt.under, { name = 'industrious:copper_block' })

	-- Gold Block > Raw Gold Block
    	elseif (under.name == 'default:goldblock')
        	and under.name ~= 'industrious:gold_block'
    	then
 		minetest.set_node(pt.under, { name = 'industrious:gold_block' })

	end

    -- play sound
    minetest.sound_play('default_dug_metal', {
        pos = pt.under,
        gain = 1.0,
	pitch = 0.8
    })

        itemstack = industrious.add_wear(itemstack)
   	return itemstack
end


-- Steel Hammer

minetest.register_tool('industrious:steel_hammer', {
	description = 'Steel Sledgehammer',
	inventory_image = 'industrious_hammer_steel.png',

	tool_capabilities = {
		full_punch_interval = 3.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=3.0, [2]=2.0, [3]=1.00}, uses=5, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},

	sound = {breaks = 'default_tool_breaks'},
	groups = {hammer = 1},
	on_place = industrious.steel_hammer
})

minetest.register_craft({
	output = "industrious:steel_hammer",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"", "group:stick", ""},
	}
})

--- BRONZE

-- Bronze Hammer

minetest.register_tool('industrious:bronze_hammer', {
	description = 'Bronze Sledgehammer',
	inventory_image = 'industrious_hammer_bronze.png',

	tool_capabilities = {
		full_punch_interval = 3.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=2.8, [2]=1.8, [3]=0.8}, uses=7, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},

	sound = {breaks = 'default_tool_breaks'},
	groups = {hammer = 1},
	on_place = industrious.steel_hammer
})

minetest.register_craft({
	output = "industrious:bronze_hammer",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "group:stick", "default:bronze_ingot"},
		{"", "group:stick", ""},
	}
})