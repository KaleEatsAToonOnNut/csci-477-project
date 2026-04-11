function ini_write_struct(chunk, obj){
    ini_write_real(chunk, "objLength", struct_names_count(obj));
    var keys = variable_struct_get_names(obj);
    for(var i = 0; i < struct_names_count(obj); i++) {
        ini_write_string(chunk, "key" + string(i), keys[i]);
        if(typeof(obj[$ keys[i]]) == "string") {
            ini_write_string(chunk, "type" + string(i), "s");
            ini_write_string(chunk, "val" + string(i), obj[$ keys[i]]);
        } else if(typeof(obj[$ keys[i]]) == "struct") {
            ini_write_string(chunk, "type" + string(i), "o");
            ini_write_struct(chunk + "val" + string(i), obj[$ keys[i]]);
        } else if(typeof(obj[$ keys[i]]) == "array"){
            ini_write_string(chunk, "type" + string(i), "a");
            ini_write_array(chunk + "val" + string(i), obj[$ keys[i]]);
        } else if(typeof(obj[$ keys[i]]) == "ref") {
            ini_write_string(chunk, "type" + string(i), "r");
            ini_write_string(chunk, "val" + string(i), get_name(obj[$ keys[i]]));
        } else if(typeof(obj[$ keys[i]]) == "method") {
            ini_write_string(chunk, "type" + string(i), "c");
            ini_write_string(chunk, "val" + string(i), script_get_name(obj[$ keys[i]]));
        } else if(typeof(obj[$ keys[i]]) == "number") {
            ini_write_string(chunk, "type" + string(i), "n");
            ini_write_real(chunk, "val" + string(i), obj[$ keys[i]]);
        }
    }
}