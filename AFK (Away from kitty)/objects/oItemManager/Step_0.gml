/// OitemManger Step
// 닫혀 있으면 선택 해제하고 끝
if (!global.inv_open) {
    selected_item = -1;
    exit;
}

// GUI 좌표 취득
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);



//get selected item
selected_item = -1;
for (var i = 0 ; i < array_length(inv); i++)
	{
		var _xx = screen_bord_x;
		var _yy = screen_bord_y + sep * i;
		
	if mouse_x > _xx && mouse_x < _xx + 15 && mouse_y > _yy && mouse_y < _yy + 15 
		{
		selected_item = i;	
		}
	}

