lines = [];
prevCommands = [];
listening = false;
textBuffer = "";
typeable = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,./;'[]\\-=<>?:{}|_+\"`~!@#$%^&*()"
cursorIndex = 0;

function printToConsole(text) {
    array_push(lines, text);
    
}

ui = instance_create_layer(0, 0, "Instances", ObjectElementUI)
    .setWidth("6in")
    .setHeight("7in")
    .centerX()
    .centerY()
    .createNewChild(ObjectText)
        .setWidth("5in")
        .setHeight("5in")
        .centerX()
        .setY("1hin")
        .getParent()
    .createNewChild(ObjectText)
        .setWidth("5in")
        .setHeight("1hin")
        .centerX()
        .setY("11hin")
        .getParent();