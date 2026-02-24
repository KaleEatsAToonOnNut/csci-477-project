/// OitemManger Draw GUI
if (!global.inv_open) exit;

draw_set_font(global.font);
for (var i = 0 ; i < array_length(inv); i++)
	{
		var _xx = screen_bord_x;
		var _yy = screen_bord_y;
		var _sep = sep;
		var _col = c_white;
		
		//icon
		draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep * i);
		
		//get "selected" color 
		if selected_item == i { _col = c_fuchsia ;}; 
		draw_set_color(_col);
		
		//name
		draw_text (_xx + 35, _yy + _sep * i, inv[i].name);
		
		//description
		if selected_item == i
		 {
		 draw_text_ext(_xx + 17, _yy + _sep * array_length(inv), inv[i].description, 25, 300);
		 }
		
		//rest color to white
		draw_set_color(c_white);
	}
