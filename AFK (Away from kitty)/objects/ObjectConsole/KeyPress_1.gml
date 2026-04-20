if(!listening) {
    return;
}

if(keyboard_check(vk_enter)) {
    commandList(textBuffer);
    printToConsole(textBuffer);
    
    textBuffer = "";
    return;
}

if(keyboard_check(vk_backspace)) {
    string_replace(textBuffer, string_char_at(textBuffer, cursorIndex), "");
    return;
}

if(keyboard_check(vk_left)) {
    cursorIndex -= 1;
}

if(keyboard_check(vk_right)) {
    cursorIndex += 1;
}

var keyPressed = keyboard_lastchar;

if(string_pos(keyPressed, typeable) == 0) {
    return;
}

string_insert(textBuffer, keyPressed, cursorIndex)
cursorIndex++;