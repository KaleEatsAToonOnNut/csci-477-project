draw_set_colour(c_white);
draw_set_font(fTimer);


var t= "";
t += string(t_min)
t += ":"
if t_sec > 9 {t += "" + string(t_sec)}
if t_sec < 10 {t += "0" + string(t_sec)}
t += "."; 
t += string(t_mil);

draw_text(1300,5,t);

if Object_button.time_up == true {
	var q = "";
	q += "your highest score is ";
	q += string(score);
	draw_text(250,330, q)
} 

