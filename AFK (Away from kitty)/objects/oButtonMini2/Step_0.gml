y += spd;

if(y > room_height+sprite_height)
{
	oGame.combo =0;
	oGame.comboAlpha = 2;
	instance_destroy();
}
