draw_self();

if(background == noone) {
    draw_rectangle(ux, uy, ux + width, uy + height, false);
} else {
    draw_sprite_ext(background, 0, ux, uy, width / backX, height / backY, 0, c_white, 1.0);
}

draw_rectangle_colour(ux, uy, ux + width, uy + height, outline, outline, outline, outline, true);