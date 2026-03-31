draw_set_font(global.font_main);

for (var i = 0; i < array_length(inv); i ++)
{
var _xx = camera_get_view_x(view_camera[0]) + 18;
var _yy = camera_get_view_y(view_camera[0]) + 18;    
var _sep = sep;    
var _col = c_white;    
    
//icon    
draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep * i);
    
//get "selected" color
if selected_item == i{
    _col = c_yellow;
}    
draw_set_color(_col);    
    
//name    
draw_text_transformed(
    _xx + 18,
    _yy + _sep * i,
    inv[i].name,
    0.5, 0.5,   // xscale, yscale
    0
);

//description     
if selected_item == i {
    draw_text_ext_transformed(
    _xx + 18,
    _yy + _sep * array_length(inv),
    inv[i].description,
    9,
    125,
    0.4, 0.4,
    0
);
}       


//reset color to white        
draw_set_color(c_white);    
}

