if(getState("STATE_PAUSED")) {
    
    instance_destroy(ui);
    ui = noone;
    removeState("STATE_PAUSED");
    removeState("STATE_FROZEN");
    
} else {
    
    ui = instance_create_layer(0, 0, "Instances", ObjectElementUI)
        .setWidth("3in")
        .setHeight("3in")
        .centerX()
        .centerY()
        .createNewChild(ObjectArrayButtonContainer)
            .createNewChild(ObjectButton)
                .setWidth("2in")
                .setHeight("1cm")
                .centerX()
                .setY("1hin")
                .setCallback(UIScriptResume)
                .createNewChild(ObjectText)
                    .setText("Resume")
                    .centerX()
                    .fixTextAlign()
                    .centerY()
                    .getParent().getParent()
            .createNewChild(ObjectButton)
                .setWidth("2in")
                .setHeight("1cm")
                .centerX()
                .setY("2hin")
                .setCallback(UIScriptCatnap)
                .createNewChild(ObjectText)
                    .setText("Save and Rest")
                    .centerX()
                    .fixTextAlign()
                    .centerY()
                    .getParent().getParent()
            .createNewChild(ObjectButton)
                .setWidth("2in")
                .setHeight("1cm")
                .centerX()
                .setY("3hin")
                .setCallback(UIScriptQuit)
                .createNewChild(ObjectText)
                    .setText("Quit")
                    .centerX()
                    .fixTextAlign()
                    .centerY()
                    .getHead();
    
    setState("STATE_PAUSED");
    setState("STATE_FROZEN");
}