function ini_read_array(chunk){
    var arrayOut = [];
    var arrLength = ini_read_real(chunk, "arrLength", 0);
    for(var i = 0; i < arrLength; i++) {
        var type = ini_read_string(chunk, "type" + string(i), "n")
        if(type == "s") {
            array_push(arrayOut, ini_read_string(chunk, "val" + string(i), ""));
        } else if(type == "o") {
            array_push(arrayOut, ini_read_struct(chunk + "val" + string(i)));
        } else if(type == "a") {
            array_push(arrayOut, ini_read_array(chunk + "val" + string(i)));
        } else if(type == "r" || type == "c") {
            array_push(arrayOut, asset_get_index(ini_read_string(chunk, "val" + string(i), "null")));
        } else {
            array_push(arrayOut, ini_read_real(chunk, "val" + string(i), 0));
        }
    }
    return arrayOut;
}