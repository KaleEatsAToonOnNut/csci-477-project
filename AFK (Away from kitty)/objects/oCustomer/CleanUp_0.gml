/// oCustomer: Clean Up
if (instance_exists(target_seat)) {
    if (target_seat.occupant_id == id) {
        target_seat.occupied = false;
        target_seat.occupant_id = noone;
    }
}
if (variable_global_exists("customer_count")) {
    global.customer_count = max(0, global.customer_count - 1);
}
