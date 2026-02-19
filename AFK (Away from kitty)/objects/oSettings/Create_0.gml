if (instance_number(oSettings) > 1) { instance_destroy(); exit; }
global.font_main = font_add_sprite(sMainFont, 32, true, 1);

if (!variable_global_exists("font_main")) {
    var glyphs = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    global.font_main = font_add_sprite(sMainFont, glyphs, true, 1);
    // 필요하면 전역 플래그
    global.font_is_dynamic = true;
}