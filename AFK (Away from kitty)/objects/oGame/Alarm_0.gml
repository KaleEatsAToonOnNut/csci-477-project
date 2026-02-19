var rand = choose(1,2,3,4);

var inst = instance_create_depth(room_width/5*rand,0,0,oButtonMini2)

inst.image_index = rand-1;

alarm[0] = room_speed/2;
