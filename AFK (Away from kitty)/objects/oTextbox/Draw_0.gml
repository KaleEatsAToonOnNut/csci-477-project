var _font = variable_global_exists("font_main") ? global.font_main : -1;
draw_set_font(_font); // -1이면 기본 폰트
accept_key = keyboard_check_pressed(vk_space);

// 1) set textbox position FIRST
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 330;

var _font_h = string_height("Åy");              // 상승/하강 포함 샘플
line_sep = max(line_sep, ceil(_font_h * 1.15)); // 최소 115% 확보 (필요시 1.25로)

//setup
if setup== false
{
	
	setup = true;
	draw_set_font(_font);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	// 뷰 치수(오프셋은 textbox_x에 더해지므로 뷰 폭만 필요)
	var view_w = camera_get_view_width(view_camera[0]);
	
	//loop through the pages
	
	for(var p =0; p < page_number; p++) {
		//find how many characters are on each and store that number in the "text_length" array
		text_length[p] = string_length(text[p]);
		
		//get the x position for the textbox
		//character on the left
		portrait_x_offset[p] = 162;
		text_x_offset[p] = portrait_x_offset[p] + portrait_box_w + portrait_gutter;
		
		//character on right
		if (speaker_side[p] == -1)
		{
		// 포트레이트 박스는 오른쪽 끝에서 margin(=162)만큼 안쪽에 배치
		portrait_x_offset[p] = view_w + 1400  - portrait_box_w;
		// 텍스트 박스는 왼쪽으로 보내서 겹치지 않게
		text_x_offset[p] = 402;
		}
		
		//no character (center the textbox)
		if speaker_sprite[p] == noone {
			text_x_offset[p] = 352;
		}
		
		last_free_space       = 1;
		line_break_num[p]     = 0;
		line_break_offset[p]  = 0;
		
		//
		for (var c= 0; c < text_length[p]; c++)
			{
				var _char_pos = c + 1;
				
				//store individual characters in the "char" array
				char[c, p] = string_char_at(text[p], _char_pos);
				
				//get current width of the line
				var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
				var _current_txt_w = string_width(_txt_up_to_char) - string_width( char[c, p]);
				
				//get the last free space
				if char[c, p] == " " {last_free_space = _char_pos + 1};
				
				//get the line breaks
				if _current_txt_w - line_break_offset[p] > line_width
				{
					 // 공백이 있으면 거기서 끊고, 없으면 현재 글자에서 강제 개행
					var cut_pos = (last_free_space > 1) ? last_free_space : _char_pos;
					line_break_pos[ line_break_num[p], p ] = cut_pos;
				    line_break_num[p]++;

				    var _txt_up_to_cut = string_copy(text[p], 1, cut_pos);
				    var _cut_char       = string_char_at(text[p], cut_pos);
				    line_break_offset[p] = string_width(_txt_up_to_cut) - string_width(_cut_char);

				    // 다음 줄 준비: 마지막 공백 위치를 업데이트
				    last_free_space = cut_pos + 1;
					
				}
				
		
			}
		//getting each characters coordinates
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c + 1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			//get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width( char[c, p]);
			var _txt_line = 0;
			
			//compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				//if the current looping is after a line break
				if _char_pos >= line_break_pos[lb, p]
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					//recod the "line" this character should be on
					_txt_line = lb + 1; // + 1 since lb starts at 0
				}
			}
		//add to the x and y coordinate base on the new info
		char_x[c, p] = _txt_x + _current_txt_w;
		char_y[c, p] = _txt_y + _txt_line * line_sep;
			
		}
	}
}

//typing the text
if text_pause_timer <= 0 {
	if draw_char < text_length[page]
	 {
	 draw_char += text_spd;
	 draw_char = clamp(draw_char, 0, text_length[page]);
	 var _check_char = string_char_at (text[page], draw_char);
	 if _check_char == "." || _check_char == "?" || _check_char == ","
		{
		text_pause_timer = text_pause_time;
	
		}
 
	 }
} else {
	
	text_pause_timer--;
	
}

 
 //flip thorugh pages
 if (accept_key)
 {
	//if the typing is done
	if draw_char == text_length[page]
	{
		//next page
		if page < page_number -1 
		{
			page++;
			draw_char = 0;
		}
		//destory textbox
		else
		{
			//link text for options
			if option_number > 0{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
	//if not done typing 
	else {
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
	}
 }
 
 

 
 
 //draw the textbox
 var _textb_x = textbox_x + text_x_offset[page];
 var _textb_y = textbox_y;
 textb_img += textb_img_spd;
	// 이번 페이지의 텍스트박스 스프라이트 선택 (없으면 기본값 사용)
	var _panel_spr = (is_undefined(txtb_spr[page]) || txtb_spr[page] == noone)
	    ? textb_spr          // 기본 스칼라
	    : txtb_spr[page];    // 페이지별

	var _panel_w = sprite_get_width(_panel_spr);
	var _panel_h = sprite_get_height(_panel_spr);
	
	// ── 추가: 초상 패널 스킨 = 텍스트박스 패널 스킨 재사용 ──
	var _portrait_panel_spr = _panel_spr;
	var _pp_w = _panel_w;
	var _pp_h = _panel_h;
	
	// target scale, but cap so scaled text fits inside the fixed panel
	var sc_target = 2.2;          // try 1.5–2.2
	var content_w = textbox_width  - 2 * border;
	var content_h = textbox_height - 2 * border;
	var lines     = max(1, (is_undefined(line_break_num[page]) ? 0 : line_break_num[page]) + 1);

	var sc_w = content_w / line_width;                // width cap (uses your existing line_width)
	var sc_h = content_h / (line_sep * lines);        // height cap
	var sc   = max(1, min(sc_target, sc_w, sc_h));    // final scale

 
 //draw the speaker
 if speaker_sprite[page] != noone
 {
	
	// 1) 포트레이트 패널(배경) 위치/크기
    var box_left = textbox_x + portrait_x_offset[page];
    var box_top  = textbox_y;
	
	// 패널 스킨 크기/원점/스케일
	var _pp_w = sprite_get_width(_portrait_panel_spr);
	var _pp_h = sprite_get_height(_portrait_panel_spr);
	var sxp   = portrait_box_w / _pp_w;
	var syp   = portrait_box_h / _pp_h;
	var pox   = sprite_get_xoffset(_portrait_panel_spr);
	var poy   = sprite_get_yoffset(_portrait_panel_spr);
	
	// (선택) 미세 보정
	var nudge_x = 0;
	var nudge_y = 0;

	// 원점 보정해서 그리기: 보이는 좌상단이 (box_left, box_top)이 되도록
	draw_sprite_ext(
	    _portrait_panel_spr, textb_img,
	    round(box_left + pox * sxp + nudge_x),
	    round(box_top  + poy * syp + nudge_y),
	    sxp, syp, 0, c_white, 1
	);

	// 이후 초상 그리기(중앙 정렬)는 그대로 사용해도 OK
	var spr   = speaker_sprite[page];
	var w     = sprite_get_width(spr);
	var h     = sprite_get_height(spr);
	var xorig = sprite_get_xoffset(spr);
	var yorig = sprite_get_yoffset(spr);

	var pad   = 8;
	var max_w = portrait_box_w - pad * 2;
	var max_h = portrait_box_h - pad * 2;
	var sfit  = min(max_w / w, max_h / h);

	var xs = speaker_side[page] * sfit;
	var ys = 1 * sfit;

	// 패널 시각적 좌상단(box_left, box_top)을 기준으로 중앙 좌표
	var cx = box_left + nudge_x + portrait_box_w * 0.5;
	var cy = box_top  + nudge_y + portrait_box_h * 0.5;

	var dx = round(cx + (xorig - w * 0.5) * xs);
	var dy = round(cy + (yorig - h * 0.5) * ys);

	draw_sprite_ext(spr, image_index, dx, dy, xs, ys, 0, c_white, 1);
 }
 
 //back of the textbox
draw_sprite_ext(
    _panel_spr, textb_img,
    _textb_x, _textb_y,
    textbox_width / _panel_w,
    textbox_height / _panel_h,
    0, c_white, 1
);
 
 
  //options
 if draw_char == text_length[page] && page == page_number - 1
 {
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1); 
	
	//draw the options
	var _op_space = 55 * sc;
	var _op_bord  = 15 * sc;

	for (var op = 0; op < option_number; op++)
	{
	    // coerce to string once
	    var _opt_str = string(option[op]);

	    // panel width must match scaled text width
	    var _o_w = (string_width(_opt_str) * sc) + _op_bord * 2;
		
		// 이 옵션 행의 상단
	    var opt_top = _textb_y - _op_space*option_number + _op_space*op;

	    // 텍스트 실제 높이(스케일 반영)
	    draw_set_font(global.font_main); // 안전차원
	    var str_h = string_height(_opt_str) * sc;

	    // 가로폭/배경 패널 크기
	    var _o_w = (string_width(_opt_str) * sc) + _op_bord * 2;

	    // ── 수직 중앙 정렬된 텍스트 Y ──
	    var text_y = opt_top + round((_op_space - str_h) / 2);

	    // 배경 패널
	    draw_sprite_ext(
	        _panel_spr, textb_img,
	        _textb_x + 32 * sc, opt_top,
	        _o_w / _panel_w, (_op_space - 1) / _panel_h,
	        0, c_white, 1
	    );

	    // 화살표: 박스 세로 중앙에 맞추기 (스프라이트 원점이 좌상단이라 가정)
	    var arr_h  = sprite_get_height(sTexboxArrow) * sc;
	    var arrow_y = opt_top + _op_space * 0.5 - arr_h * 0.5;
	    if option_pos == op {
	        draw_sprite_ext(sTexboxArrow, 0, _textb_x + 8 * sc, arrow_y, sc, sc, 0, c_white, 1);
	    }

	    // 옵션 텍스트(중앙 위치에 그리기)
	    draw_text_transformed_color(
	        _textb_x + 32 * sc + _op_bord,
	        text_y,
	        _opt_str,
	        sc, sc, 0,
	        c_white, c_white, c_white, c_white,
	        1
	    );
	}
	
 }
 
 
 //draw the text
// base unscaled top-left of the text area
var base_x = textbox_x + text_x_offset[page] + border;
var base_y = textbox_y + border;
 
for (var c= 0; c < draw_char; c++)
{
	//special stuff
	//floating text
	var _float_y = 0;
	if float_text[c, page] ==  true
		{
			float_dir[c, page] += -15;
			_float_y = dsin(float_dir[c, page]) * 1;
		}
	
	//shake text
	var _shake_x = 0;
	var _shake_y = 0;
	
	if shake_text[c, page] == true
	{	
		shake_timer[c, page]--;
		if shake_timer[c, page] <= 0 {
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);
		}
		if shake_timer[c, page] <= 2 {
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}

		
	}
	
	// scale positions around the base corner
    var sx = base_x + (char_x[c, page] - base_x) * sc;
    var sy = base_y + (char_y[c, page] - base_y) * sc;
	
	 // scale the effects so they match the larger text
    var ex = _shake_x * sc;
    var ey = (_float_y + _shake_y) * sc;

    draw_text_transformed_color(
        sx + ex, sy + ey,
        char[c, page],
        sc, sc, 0,
        col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page],
        1
    );
}
 