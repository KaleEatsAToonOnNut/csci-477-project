//@param {text_id} name description
function scr_game_text(_text_id){

    switch (_text_id) {
    	
        case "npc 1":
       
            scr_text("You need to help us! Please find all the villagers and defeat the giant angry slime in the north of the village!", "npc", -1); 
                //scr_text_float(3,11); //wave effect    
                //scr_text_shake(0, 1); //shake effect 
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
                //scr_text_float(3,11); //wave effect    
                //scr_text_shake(0, 1); //shake effect 
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
       
	   case "mozerella_1":
       
            scr_text("WHY ARE YOU IN MY HOME", "npc", -1); 
                scr_text_float(0,21); //wave effect    
                scr_text_shake(0, 21); //shake effect 
                scr_option("The door was unlocked", "mozerella_1 - The door was unlocked");
                scr_option("Uhhhh", "mozerella_1 - Uhhhh");
				
				break;
            case "mozerella_1 - The door was unlocked":
                scr_text("please leave.");
                break;
            case "mozerella_1 - Uhhhh":
                scr_text("please leave.");
                break;  
				
		case "chief_cheese_1":
       
            scr_text("The concil judges", "npc", -1); 
                scr_text_float(0,21); //wave effect    
                scr_text_shake(0, 21); //shake effect 
                scr_option("...", "chief_cheese_1 - ...");
                scr_option("Uhhhh OK", "chief_cheese_1 - Uhhhh OK");
				
				break;
            case "chief_cheese_1 - Uhhhh OK":
                scr_text("...");
                break;
            case "chief_cheese_1 - ...":
                scr_text("...");
                break;  
				
		case "bread_baby_1":
       
            scr_text("WA", "npc", -1); 
                scr_text_float(0,21); //wave effect    
                scr_text_shake(0, 21); //shake effect 
                scr_option("hey there big guy", "bread_baby_1 - hey there big guy");
                scr_option("wa?", "bread_baby_1 - wa?");
				
				break;
            case "bread_baby_1 - wa?":
                scr_text("this village requires you help, young traveller. We have met an arch evil force like no other. The slime in the far north of the town inside the large building is keeping us in fear. we need your help!");
                break;
            case "bread_baby_1 - hey there big guy":
                scr_text("...");
                break;
	   
    }
    
}