--
-- Storage Blocks
--

--- TIN SHELVING

local tin_shelf_formspec =
	"size[8,7;]" ..
	"list[context;tools_and_blocks;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;tools_and_blocks]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

local function update_tin_shelf(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local invlist = inv:get_list("tools_and_blocks")

	local formspec = tin_shelf_formspec
	-- Inventory slots overlay
	local bx, by = 0, 0.3
	local n_written, n_empty = 0, 0
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		local stack = invlist[i]
		if stack:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;industrious_tin_shelf_slot.png]"
		else
			local metatable = stack:get_meta():to_table() or {}
			if metatable.fields and metatable.fields.text then
				n_written = n_written + stack:get_count()
			else
				n_empty = n_empty + stack:get_count()
			end
		end
		bx = bx + 1
	end
	meta:set_string("formspec", formspec)
	if n_written + n_empty == 0 then
		meta:set_string("infotext", "Empty Tin Shelving")
	else
		meta:set_string("infotext", "Tin Shelving")
	end
end

local industrious_tin_shelf_def = {
	description = "Tin Shelving",
	long_description = "Tin Shelving - holds wood, metal or stone materials.",
	tiles = {"default_tin_block.png", "default_tin_block.png", "default_tin_block.png",
		"default_tin_block.png", "industrious_tin_shelf.png", "industrious_tin_shelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_metal_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("tools_and_blocks", 8 * 2)
		update_tin_shelf(pos)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("tools_and_blocks")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "cracky") ~= 0 or minetest.get_item_group(stack:get_name(), "choppy") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "tools_and_blocks", drops)
		drops[#drops+1] = "industrious:tin_shelf"
		minetest.remove_node(pos)
		return drops
	end,
}
minetest.register_node("industrious:tin_shelf", industrious_tin_shelf_def)

--crafting

minetest.register_craft({
	output = "industrious:tin_shelf",
	recipe = {
		{"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"},
		{"", "", ""},
		{"default:tin_ingot", "default:tin_ingot", "default:tin_ingot"},
	}
})
