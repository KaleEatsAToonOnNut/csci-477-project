function ini_write_array(chunk, values){
    ini_write_real(chunk, "arrLength", array_length(values));
    for(var i = 0; i < array_length(values); i++) {
        if(typeof(values[i]) == "string") {
            ini_write_string(chunk, "type" + string(i), "s");
            ini_write_string(chunk, "val" + string(i), values[i]);
        } else if(typeof(values[i]) == "struct") {
            ini_write_string(chunk, "type" + string(i), "o");
            ini_write_struct(chunk + "val" + string(i), values[i]);
        } else if(typeof(values[i]) == "array"){
            ini_write_string(chunk, "type" + string(i), "a");
            ini_write_array(chunk + "val" + string(i), values[i]);
        } else if(typeof(values[i]) == "ref") {
            ini_write_string(chunk, "type" + string(i), "r");
            ini_write_string(chunk, "val" + string(i), get_name(values[i]));
        } else if(typeof(values[i]) == "method") {
            ini_write_string(chunk, "type" + string(i), "c");
            ini_write_real(chunk, "val" + string(i), script_get_name(values[i]));
        } else if(typeof(values[i]) == "number") {
            ini_write_string(chunk, "type" + string(i), "n");
            ini_write_real(chunk, "val" + string(i), values[i]);
        }
    }
}