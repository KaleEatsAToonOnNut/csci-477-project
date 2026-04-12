depth = -9999;

//item constructor
function create_item(_name, _desc, _spr, _effect) constructor 
{
    name = _name;
    description = _desc;
    sprite = _spr;
    effect= _effect
} 


//create items

global.item_list = {
   treat_stick : new create_item(
    "Treat_stick", 
    "The greatest offering a human can give. With just a little squeeze, all complaints fade away. Recover HP.", 
    spr_treat_stick,
    effect_treat_stick
    )
}

//create the inventory
inv = array_create(0);
inv_max = 3; 
selected_item = -1;

//for drawing and mouse positions
sep = 18;