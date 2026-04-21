function effect_treat_stick(){
    if (ObjectPlayer.hp <= ObjectPlayer.max_hp - 10)
		ObjectPlayer.hp += 10;
	else ObjectPlayer.hp = ObjectPlayer.max_hp
    //get rid of the items
    array_delete(ObjitemManager.inv, ObjitemManager.selected_item, 1);
    UIScriptResume();
}