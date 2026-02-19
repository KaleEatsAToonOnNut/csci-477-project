function seats_free_count(_seats_list) {
    var cnt = 0;
    var n = ds_list_size(_seats_list);
    for (var i = 0; i < n; i++) {
        var s = _seats_list[| i];
        if (instance_exists(s) && !s.occupied) cnt++;
    }
    return cnt;
}

function pick_free_seat(_seats_list) {
    var tmp = ds_list_create();
    var n = ds_list_size(_seats_list);
    for (var i = 0; i < n; i++) {
        var s = _seats_list[| i];
        if (instance_exists(s) && !s.occupied) ds_list_add(tmp, s);
    }
    var seat = noone;
    if (ds_list_size(tmp) > 0) {
        seat = tmp[| irandom(ds_list_size(tmp)-1)];
    }
    ds_list_destroy(tmp);
    return seat;
}

// 메뉴에서 랜덤 아이템 뽑기 (인벤토리 구조에 맞춰 자동 감지)
function get_random_menu_item() {
    if (variable_global_exists("menu_items")) {
        var m = global.menu_items;
        if (is_array(m)) {
            return m[irandom(array_length(m)-1)];
        } else if (ds_exists(m, ds_type_list)) {
            return m[| irandom(ds_list_size(m)-1)];
        }
    }
    // Fallback (임시)
    var fallback = ["Coffee","Tea","Noodles","Dumplings"];
    return fallback[irandom(3)];
}