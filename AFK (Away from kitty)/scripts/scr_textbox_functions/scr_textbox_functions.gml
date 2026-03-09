function scr_set_defaults_for_text() {
    line_break_pos[0, page_number] = 999;
    line_break_num[page_number] = 0;
    line_break_offset[page_number] = 0;
    
    
    //variables for every letter/character
    for (var c = 0; c < 500; c++)
    {
        col_1[c, page_number] = c_white;
        col_2[c, page_number] = c_white;
        col_3[c, page_number] = c_white;
        col_4[c, page_number] = c_white;
        
        float_text[c, page_number] = 0;
        float_dir[c, page_number] = c*20; //adjust if you want wave faster
        
        shake_text[c, page_number] = 0;
        shake_dir[c, page_number] = irandom(360);
        shake_timer[c, page_number] = irandom(4);
    }
    
    
    
    txtb_spr[page_number] = spr_textbox;
    speaker_sprite[page_number] = noone;
    speaker_side[page_number] = 1;
    
}

//------------text VFX --------///
//@param {list_char} name description
//@param {last_char} name description
//@param {col1} name description
//@param {col2} name description
//@param {col3} name description
//@param {col4} name description
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) {
    
    for (var c = _start; c <= _end; c++)
    {
        col_1[c, page_number-1] = _col1;
        col_2[c, page_number-1] = _col2;
        col_3[c, page_number-1] = _col3;
        col_4[c, page_number-1] = _col4;
    }
}

//@param {lst char} name description
//@param {last char} name description
function scr_text_float(_start, _end) {
    for (var c = _start; c <= _end; c++)
    {
        float_text[c, page_number -1] = true;

    }    
}

//@param {lst char} name description
//@param {last char} name description
function scr_text_shake(_start, _end) {
    for (var c = _start; c <= _end; c++)
    {
        shake_text[c, page_number -1] = true;

    }    
}

//@param {text} name description
//@param {potrait}
//@param {side} name description
function scr_text(_text){
    scr_set_defaults_for_text()
    text[page_number] = _text;
    
    //get character info
    if argument_count > 1{
       switch (argument[1]) { 
       //cat 
       case "cat":
            speaker_sprite[page_number] = cat_test;
            txtb_spr[page_number] = spr_textbox_cat; 
       break;  
        
       //npc
       case "npc":
            speaker_sprite[page_number] = npc_test;
            txtb_spr[page_number] = spr_textbox_npc; 
       break;    
        //add other emotion or character info here
       }
        
    }
    
    //side the charater is on
    if argument_count > 2 {
        speaker_side[page_number] = argument[2];
    }    
    
    page_number++;
}

//@param {option, link_id} name description
function scr_option(_option, _link_id) {
    option[option_number] = _option
    option_link_id[option_number] = _link_id 
    
    option_number++;
}

// @param {text_id} name description
function create_textbox(_text_id) {
    with( instance_create_depth(0, 0, -9999, obj_textbox))
    {
        scr_game_text(_text_id);
    }
}