function commandList(command) {
    switch (command) {
    	case "noclip":
            if(instance_exists(ObjectPlayer)) {
                ObjectPlayer.flipState("STATE_NO_WALL_COLLIDE");
            }
            break;
        
    }
}