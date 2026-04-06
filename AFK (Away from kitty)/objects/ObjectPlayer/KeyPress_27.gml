if(getState("STATE_PAUSED")) {
    instance_destroy(ui);
    ui = noone;
    removeState("STATE_PAUSED");
} else {
    ui = instance_create_layer(0, 0, "Instances", ObjectElementUI);
    ui.setWidth("4in");
    ui.setHeight("4in");
    var button = instance_create_layer(0, 0, "Instances", ObjectButton);
    button.setWidth("2in");
    button.setHeight("1cm");
    button.text = "Test button";
    ui.addChild(button);
    setState("STATE_PAUSED");
}