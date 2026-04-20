function effect_treat_stick(_target){
    if (ObjectPlayer.hp <= ObjectPlayer.max_hp - 10)
		ObjectPlayer.hp += 10;
	else ObjectPlayer.hp = ObjectPlayer.max_hp
    show_debug_message(_target.selected_item)
    //get rid of the items
    array_delete(_target.inv, _target.selected_item, 1);
}