function effect_treat_stick(paramIn){
    if (ObjectPlayer.hp <= ObjectPlayer.max_hp - 10)
		ObjectPlayer.hp += 10;
	else ObjectPlayer.hp = ObjectPlayer.max_hp
    //get rid of the items
    array_delete(ObjitemManager.inv, paramIn[0], 1);
    UIScriptResume();
}