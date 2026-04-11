function effect_treat_stick(_target){
    ObjectPlayer.hp += 10;
    show_debug_message(_target.selected_item)
    //get rid of the items
    array_delete(_target.inv, _target.selected_item, 1);
}