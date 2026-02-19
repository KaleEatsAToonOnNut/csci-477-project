function scr_game_text(_text_id){
	
switch(_text_id) {
//scr_text_color(4, 8, c_black, c_black, c_black, c_black); scr_text_shake(0, 8);
	case "death":
		scr_text("Do you have question?", "death", -1);
			scr_option("Where am I?", "question 1");
			scr_option("How old are you?", "question 2");
			scr_option("What happens to the real world?", "question 3")
			//scr_option("Lets start", "game start")
			break;
			

		
		case "question 1":
				scr_text("What is this place?", "tina");
				scr_text("Oh! Good question.", "death-silly", -1);
				scr_text("Think of this as a waiting room where you wait for judgment before heading to Heaven, or Hell.", "death", -1);
						scr_text_float(19, 30); scr_text_float(78, 83); scr_text_color(78, 83, c_white, c_aqua, c_white, c_aqua); scr_text_shake(89,93); scr_text_color(89, 93, c_red, c_maroon, c_red, c_maroon); 
				scr_text("Heaven... and Hell...? Then does God exist?", "tina");
						scr_text_color(0, 5, c_white, c_aqua, c_white, c_aqua); scr_text_color(14, 17, c_red, c_maroon, c_red, c_maroon); scr_text_color(32, 35, c_yellow, c_white, c_yellow, c_white)
				scr_text("Yes", "death", -1);
				scr_text("I’ve never seen Him myself", "death-um", -1);
				scr_text("But He must exist. Otherwise, who would be making slackers like us do any work?", "death-silly", -1);
					scr_text_float(50, 58);
				scr_text("Then... is the Bible real!?", "tina-suprised");
					scr_text_shake(7, 26);
				scr_text("What the heck is bible?", "death", -1);
				scr_text(". . .", "tina-mad");
				break;
		
		case "question 2":
				scr_text("How old are you?", "tina");
				scr_text("That’s... what you’re curious about…?", "death-disappoint", -1);
				scr_text("Why...? I’m allowed to be curious.", "tina-ignore");
					scr_text_float(0, 6);
				scr_text("You humans really are strange...", "death-disappoint", -1);
					scr_text_float(22, 28);
				scr_text("Age? That’s just your meet-counter for me.", "death-uwu", -1);
				scr_text("I meet me every day", "death", -1);
				scr_text("so... zero seconds old. Guess I need a pacifier for payroll.", "death-um", -1);
					scr_text_shake(0, 1); scr_text_float(6,22); scr_text_float(39,47); scr_text_color(39, 47, c_fuchsia, c_white, c_fuchsia, c_white);
				scr_text("HA HA HA HA HA HA HA HA!!!", "death-silly", -1);	
					scr_text_shake(0, 25); scr_text_float(0, 25);
				scr_text(". . .", "tina-mad");
				scr_text("Just kidding.", "death", -1);
				scr_text("I don’t know how old I am. But there’s something I do remember.", "death-um", -1);
				scr_text("Was it when the universe had its fifth Big Bang...?", "death", -1);
					scr_text_float(39, 46); scr_text_color(39, 46, c_dkgray, c_red, c_maroon, c_dkgray);
				scr_text("I got so bored I started messing around, and whatever I nudged made all sorts of gases gather in one place.", "death", -1);
				scr_text("It grew bigger and bigger... and then, with a tremendous burst of light, it was born.", "death", -1);
					scr_text_shake(8,13); scr_text_float(19,24);scr_text_shake(19,24); scr_text_color(65, 70, c_yellow, c_white, c_yellow, c_white)
				scr_text("No way..?", "tina-suprised");
					scr_text_shake(0,7);
				scr_text("Thats how I made the sun", "death-silly", -1);
					scr_text_color(21, 23, c_yellow, c_white, c_yellow, c_white)
			break;
			
			
		case "question 3":
			scr_text("When you’re off partying, what happens to the real world?", "tina");
			scr_text("What do you mean?", "death", -1);
			scr_text("If someone dies while you’re doing this, what happens to their soul?", "tina");
			scr_text("Ah. They become an earthbound spirit. A lingering ghost.", "death-disappoint", -1);
			scr_text("What?!", "tina-suprised");
				scr_text_shake(0,6);scr_text_float(0,6);
			scr_text("Normally, I’d bring them here, of course.", "death", -1);
			scr_text("But I’m on break. You don’t like working on break either, do you?", "death-disappoint", -1);
				scr_text_float(11,15);
			scr_text("Well... I mean, that’s true, but...", "tina-ignore");
				scr_text_float(0,3); scr_text_float(29,31);
			scr_text("Then be grateful for all the souls I’ve collected up to now.", "death", -1);
			break;
		
		//case "game start":
			//scr_text("Alright", "death", -1);
			//SlideTransition(TRANS_MODE.GOTO, Night);
			//break

	}

}