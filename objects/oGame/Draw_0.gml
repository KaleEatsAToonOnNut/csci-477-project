draw_set_color(c_white);
draw_line_width(0, 470, room_width, 470, 5);



////Arrows

draw_sprite_ext(sButton, 0, room_width/5,470, arrow1, arrow1, 0, c_black, 1);
draw_sprite_ext(sButton, 1, room_width/5*2,470, arrow2, arrow2, 0, c_black, 1);
draw_sprite_ext(sButton, 2, room_width/5*3,470, arrow3, arrow3, 0, c_black, 1);
draw_sprite_ext(sButton, 3, room_width/5*4,470, arrow4, arrow4, 0, c_black, 1);

//text


draw_text(10, 50, combo);

draw_text(10,90, "Score " + string(score));

//combo

draw_set_halign(fa_center);
var c_turquoise = make_color_rgb(16,239,194);
if (combo == 0) draw_text_color(room_width/2, room_height/2 -150, "misssed", c_purple, c_purple, c_purple,c_purple, comboAlpha);
if (combo <= 5 && combo != 0) draw_text_color(room_width/2 , room_height/2 -150, "bad", c_red,c_red ,c_red, c_red, comboAlpha);
if (combo >= 40) draw_text_color(room_width/2, room_height/2 -150, "flawless", c_turquoise,c_turquoise ,c_turquoise,c_turquoise, comboAlpha);
else if (combo >= 20) draw_text_color(room_width/2, room_height/2 -150, "perfect", c_blue, c_blue, c_blue, c_blue, comboAlpha );
else if (combo >= 5) draw_text_color(room_width/2, room_height/2 -150, "good", c_lime, c_green, c_green, c_green, comboAlpha );

draw_set_halign(fa_left);