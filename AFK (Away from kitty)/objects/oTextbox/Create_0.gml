depth = -9999;

//textbox parameters
textbox_width = 750;
textbox_height = 170;
border = 15;
line_sep = 12; 
line_width = textbox_width - border * 2;
textb_spr = sDialogD;
portraitb_spr = sDialogD;
textb_img = 0;
textb_img_spd = 6/60;

global.dialog_active = true;
global.inv_open = false;

with (oPlayer) {
    hascontrol = false;   // 이동·입력 차단
    hsp = 0;              // 즉시 정지
    key_left = 0;
    key_right = 0;
    // (선택) 애니 고정 원하면 아래 3줄
    // sprite_index = spr_idle;
    // image_index  = 0;
    // image_speed  = 0;
}

// portrait panel sizing (배경 박스)
portrait_box_w   = 220;             // 포트레이트 배경 너비
portrait_box_h   = textbox_height;  // 텍스트 박스 높이와 동일
portrait_pad     = 8;               // 박스 안쪽 여백(캐릭터와 박스 사이)
portrait_gutter  = 20;              // 포트레이트 박스와 텍스트 박스 사이 간격


//the text
page = 0;	
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char =0;
text_spd = 1;
//options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;




setup = false;

//effects:
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;

// Portrait animation speed (frames per second)
speaker_anim_fps = 14;                    // 원하는 FPS (예: 6)
image_speed = speaker_anim_fps/room_speed;

if (is_undefined(portraitb_spr)) portraitb_spr = textb_spr;
