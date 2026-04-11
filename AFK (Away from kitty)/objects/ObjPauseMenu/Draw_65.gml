resW = browser_width;
resH = browser_height;

instance_deactivate_all(true);
pauseSurf = surface_create(resW, resH);
surface_set_target(pauseSurf);
draw_surface(application_surface, 0, 0);
surface_reset_target();
if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);