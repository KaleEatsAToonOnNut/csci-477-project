if(keyboard_check_released(ord("W")) || keyboard_check_released(vk_up) || keyboard_check_released(ord("S")) || keyboard_check_released(vk_down)) {
    directions.y = 0;
}

if(keyboard_check_released(ord("A")) || keyboard_check_released(vk_left) || keyboard_check_released(ord("D")) || keyboard_check_released(vk_right)) {
    directions.x = 0;
}