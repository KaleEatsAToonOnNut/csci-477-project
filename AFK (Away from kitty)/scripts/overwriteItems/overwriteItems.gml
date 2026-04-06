function overwriteItems(struct, subStruct){
    var keys = variable_struct_get_names(subStruct);
    for(i = 0; i < struct_names_count(subStruct); i++) {
        var k = keys[i];
        struct[$ k] = subStruct[$ k];
    }
    return struct;
}