//@param {text_id} name description
function scr_game_text(_text_id){

    switch (_text_id) {
    	
        case "npc 1":
            scr_text("Hi I'm Cat! anshfakjhkjfasbvksbdkvbkasjb", "cat");
                scr_text_color(7, 9, c_red /*top left*/, c_red /*top right*/, c_red/*Bottom left*/, c_red /*Bottom right*/); scr_text_color(0, 1, c_yellow /*top left*/, c_red /*top right*/, c_yellow/*Bottom left*/, c_red /*Bottom right*/); //color
            scr_text("Hi I'm npc! anshfakjhkjfasbvksbdkvbkasjb", "npc", -1); 
                scr_text_float(3,11); //wave effect    
                scr_text_shake(0, 1); //shake effect 
                scr_option("Hi", "npc 1 - hi");
                scr_option("No", "npc 1 - no");
            break;
            case "npc 1 - hi":
                scr_text(":)");
                break;
            case "npc 1 - no":
                scr_text(":(");
                break;   
       
    }
    
}