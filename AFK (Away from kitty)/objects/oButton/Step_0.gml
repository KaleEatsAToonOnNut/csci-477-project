if (keyboard_check_pressed(vk_left))
{
	if (oMini1.selected) {
		oMini1.selected = false;
	}
	else if (oMini2.selected){
		oMini2.selected = false;
		oMini1.selected = true;
	} 
}
if (keyboard_check_pressed(vk_right)) 
{
	if (oMini1.selected) {
		oMini1.selected = false;
		oMini2.selected = true;
	}
	else if (oMini2.selected){
		oMini2.selected = false;
	} 

}