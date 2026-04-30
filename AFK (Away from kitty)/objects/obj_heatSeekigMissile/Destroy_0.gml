if(instance_exists(ObjectPlayer)) {
    with(ObjectPlayer) {
        if(ui != noone) {
            instance_destroy(ui);
        }
        
        ui = instance_create_layer(0, 0, "Instances", ObjectText)
            .setText("You Win!")
            .setWidth("4in")
            .setFontSize(4.0)
            .centerX()
            .setY("2in")
            .fixTextAlign();
        
        setState("STATE_PAUSED");
    }
}