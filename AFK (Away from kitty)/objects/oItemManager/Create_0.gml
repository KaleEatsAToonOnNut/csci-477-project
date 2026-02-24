if (!variable_global_exists("inv_open")) global.inv_open = false;

depth = -9999;

global.font = font_add_sprite(sMainFont_1, 32, true, 1);

//item constructor
function create_item(_name, _desc,_price, _spr) constructor {
	name = _name;
	price = _price;
	description = _desc;
	sprite = _spr;

}

//create the items
global.item_list = {
	
	
	Styx_water : new create_item(
		"Styx Water", 	
		"$1: River Styx water. A toast to purified souls and new beginnings.",
		1,
		sWater
	),
	
	Jack_o_Lager : new create_item(
		"Jack-o-Lager",
		"$12: A drink obtained from a monster that produces its own cola fizz. A hybrid where cola aroma and lager foam burst together, leaving a crisp, refreshing feel." ,
		12,
		sCola
	),
	
	Manscholow_Chorus : new create_item(
		"Manscholow Chorus",
		"$45: Signature layers of herbal root and mallow foam, stacked like a chorus… Wait! are we eating them?!",
		45,
		sCocktail	
	),
	
	MelanChips : new create_item(
		"MelanChips",
		"$60: Emotion-eating chips harvested from the Potato-Chip Tree where the Gatekeeper dwells. They carry the Underworld’s most popular flavor: Fear.",
		60,
		sChips
	)
	
	
} 

//create the inventory
inv = array_create(0);
		array_push(inv, global.item_list.Styx_water);
		array_push(inv, global.item_list.Jack_o_Lager);
		array_push(inv, global.item_list.Manscholow_Chorus);
		array_push(inv, global.item_list.MelanChips);
		
selected_item = -1;

		
//for drawing and mouse position
sep = 25;
screen_bord_x = 28;
screen_bord_y = 17;
