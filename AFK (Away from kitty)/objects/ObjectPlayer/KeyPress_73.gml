if(getState("STATE_PAUSED")) {
    
    instance_destroy(ui);
    ui = noone;
    
    removeState("STATE_PAUSED");
    removeState("STATE_FROZEN");
    
} else {
    
    ui = instance_create_layer(0, 0, "Instances", ObjectElementUI)
        .setWidth("7in")
        .setHeight("6in")
        .centerX()
        .centerY()
        .createNewChild(ObjectMatrixButtonContainer)
            .setRows(3)
            .addChildrenFromArray(ObjitemManager.inv, UIScriptMatrixItemMapping())
            .formatCells()
            .ifEmpty()
            .createNewChild(ObjectText)
                .setValue("Inventory empty!")
                .setFontSize(2.0)
                .centerX()
                .fixTextAlign()
                .centerY()
                .getHead();
    
    setState("STATE_FROZEN");
    setState("STATE_PAUSED");
}