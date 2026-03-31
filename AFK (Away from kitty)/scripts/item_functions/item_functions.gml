//pickup items
function item_add(_item)
{
    var _added = false;
    
    if array_length(ObjitemManager.inv) < ObjitemManager.inv_max
    {
        array_push( ObjitemManager.inv, _item);
        _added = true;
    }    
    
    return _added;
    
}