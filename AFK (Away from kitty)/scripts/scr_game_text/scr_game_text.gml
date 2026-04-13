//@param {text_id} name description
function scr_game_text(_text_id){

    switch (_text_id) {
    	
        case "npc 1":
       
            scr_text("You need to help us! Please defeat all the enemies in the surrounding area!", "npc", -1); 
                scr_text_float(3,11); //wave effect    
                scr_text_shake(0, 1); //shake effect 
                scr_option("OK!", "npc 1 - OK!");
                scr_option("No", "npc 1 - no");
				
				//scr_text("Hi I'm Cat! anshfakjhkjfasbvksbdkvbkasjb", "cat");
                //scr_text_color(7, 9, c_red /*top left*/, c_red /*top right*/, c_red/*Bottom left*/, c_red /*Bottom right*/); scr_text_color(0, 1, c_yellow /*top left*/, c_red /*top right*/, c_yellow/*Bottom left*/, c_red /*Bottom right*/); //color
				
            break;
            case "npc 1 - OK!":
                scr_text("Thank you!");
                break;
            case "npc 1 - no":
                scr_text(":(");
                break;   
		
		case "mozerella":
       
            scr_text("please find the other villagers! if you help us we'll give you the village's prized heirloom!", "npc", -1); 
                scr_text_float(3,11); //wave effect    
                scr_text_shake(0, 1); //shake effect 
                scr_option("OK!", "mozerella - OK!");
                scr_option("No", "mozerella - no");
				
				//scr_text("Hi I'm Cat! anshfakjhkjfasbvksbdkvbkasjb", "cat");
                //scr_text_color(7, 9, c_red /*top left*/, c_red /*top right*/, c_red/*Bottom left*/, c_red /*Bottom right*/); scr_text_color(0, 1, c_yellow /*top left*/, c_red /*top right*/, c_yellow/*Bottom left*/, c_red /*Bottom right*/); //color
				
            break;
            case "mozerella - OK!":
                scr_text("Thank you!");
                break;
            case "mozerella - no":
                scr_text(":(");
                break;   
				
		case "bread baby":
       
            scr_text("wa wa we wa", "npc", -1); 
                scr_text_float(3,11); //wave effect    
                scr_text_shake(0, 1); //shake effect 
                scr_option("ok?", "bread baby - ok?");
                scr_option("No", "bread baby - no");
				
				//scr_text("Hi I'm Cat! anshfakjhkjfasbvksbdkvbkasjb", "cat");
                //scr_text_color(7, 9, c_red /*top left*/, c_red /*top right*/, c_red/*Bottom left*/, c_red /*Bottom right*/); scr_text_color(0, 1, c_yellow /*top left*/, c_red /*top right*/, c_yellow/*Bottom left*/, c_red /*Bottom right*/); //color
				
            break;
            case "bread baby - ok?":
                scr_text("Thank you!");
                break;
            case "bread baby - no":
                scr_text("WA");
                break; 
       
    }
    
}