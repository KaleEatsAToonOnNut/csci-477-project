if(getState("STATE_PAUSED")) {
    instance_destroy(ui);
    ui = noone;
    removeState("STATE_PAUSED");
} else {
    
    ui = instance_create_layer(0, 0, "Instances", ObjectElementUI)
        .setWidth("8in")
        .setHeight("4in")
        .centerX()
        .centerY()
        .createNewChild(ObjectButton)
            .setWidth("2in")
            .setHeight("1cm")
            .centerX()
            .setY("1in")
            .setCallback(UIScriptResume)
            .createNewChild(ObjectText)
                .setText("Resume")
                .centerX()
                .fixTextAlign()
                .centerY()
                .getHead()
        .createNewChild(ObjectButton)
            .setWidth("2in")
            .setHeight("1cm")
            .centerX()
            .setY("2in")
            .setCallback(UIScriptCatnap)
            .createNewChild(ObjectText)
                .setText("Save and Rest")
                .centerX()
                .fixTextAlign()
                .centerY()
                .getHead()
        .createNewChild(ObjectButton)
            .setWidth("2in")
            .setHeight("1cm")
            .centerX()
            .setY("3in")
            .setCallback(UIScriptQuit)
            .createNewChild(ObjectText)
                .setText("Quit")
                .centerX()
                .fixTextAlign()
                .centerY()
                .getHead();
    
    setState("STATE_PAUSED");
}