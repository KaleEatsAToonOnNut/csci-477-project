function get_name(index){
    var _type = asset_get_type(index);
    
    switch(_type) {
        case asset_object: return object_get_name(index);
        case asset_sprite: return sprite_get_name(index);
        case asset_sound:  return audio_get_name(index);
        case asset_room:   return room_get_name(index);
        case asset_tiles:  return tileset_get_name(index);
        case asset_script: return script_get_name(index);
        default:           return "Unknown Asset";
    }
}