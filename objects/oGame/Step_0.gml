#region button normal
if (keyboard_check_pressed(vk_left))
{
		var bitHit = collision_line(room_width/5, 470-32, room_width/5, 470 + 32, oButtonMini2, false, true);
		if (bitHit)
		{
			score += 100;
			combo++;
			comboAlpha = 2;
			instance_destroy(bitHit);
		} else arrow1 = 0.7;
}else arrow1 = 1;
if (keyboard_check_pressed(vk_down))
{
		var bitHit = collision_line(room_width/5*2, 470-32, room_width/5*2, 470 + 32, oButtonMini2, false, true);
		if (bitHit)
		{
			score += 100;
			combo++;
			comboAlpha = 2;
			instance_destroy(bitHit);
		}else arrow2 = 0.7;
}else arrow2 = 1;
if (keyboard_check_pressed(vk_up))
{
		var bitHit = collision_line(room_width/5*3, 470-32, room_width/5*3, 470 + 32, oButtonMini2, false, true);
		if (bitHit)
		{
			score += 100;
			combo++;
			comboAlpha = 2;
			instance_destroy(bitHit);
		}else arrow3 = 0.7;
}else arrow3 = 1;
if (keyboard_check_pressed(vk_right))
{
		var bitHit = collision_line(room_width/5*4, 470-32, room_width/5*4, 470 + 32, oButtonMini2, false, true);
		if (bitHit)
		{
			score += 100;
			combo++;
			comboAlpha = 2;
			instance_destroy(bitHit);
		}else arrow4 = 0.7;
}else arrow4 = 1;
#endregion




