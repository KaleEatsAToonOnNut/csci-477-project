function unitToPixels(unit){
    var unitsList = {
        "in": 96,
        "hin": 48,
        "qin": 24,
        "ein": 12,
        "px": 1,
        "pt": 72,
        "pc": 6,
        "cm": 37.8,
        "mm": 3.78
    }
    var uom = string_letters(unit);
    var value = real(string_digits(unit));
    if(!struct_exists(unitsList, uom)) {
        return value;
    }
    return value * unitsList[$ uom];
}