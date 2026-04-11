function ini_read_struct(chunk){
    var objLength = ini_read_real(chunk, "objLength", 0);
    var objOut = {};
    for(var i = 0; i < objLength; i++) {
        var type = ini_read_string(chunk, "type" + string(i), "n")
        if(type == "s") {
            struct_set(objOut, ini_read_string(chunk, "key" + string(i), "_DEFAULT"), ini_read_string(chunk, "val" + string(i), ""));
        } else if(type == "o") {
            struct_set(objOut, ini_read_string(chunk, "key" + string(i), "_DEFAULT"), ini_read_struct(chunk + "val" + string(i)));
        } else if(type == "a") {
            struct_set(objOut, ini_read_string(chunk, "key" + string(i), "_DEFAULT"), ini_read_array(chunk + "val" + string(i)));
        } else if(type == "r" || type == "c") {
            struct_set(objOut, ini_read_string(chunk, "key" + string(i), "_DEFAULT"), asset_get_index(ini_read_string(chunk, "val" + string(i), "null")));
        } else {
            struct_set(objOut, ini_read_string(chunk, "key" + string(i), "_DEFAULT"), ini_read_real(chunk, "val" + string(i), 0));
        }
    }
    return objOut;
}