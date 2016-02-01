if (instance_exists(player_obj)) {
    player_went_west = argument0;
    player_went_east = argument1;
    player_went_north = argument2;
    player_went_south = argument3;
    player_cur_x = player_obj.x;
    player_cur_y = player_obj.y;
    if(player_cur_x < 0 && player_prev_x > 800) {
        player_went_east = 1;
        //show_debug_message("EAST");
    }
    else if (player_cur_x > 800 && player_prev_x < 0) {
        player_went_west = 1;
        //show_debug_message("WEST");
    }
    else if (player_cur_y < 0 && player_prev_y > 800) {
        player_went_south = 1;
        //show_debug_message("SOUTH");
    }
    else if (player_cur_y > 800 && player_prev_y < 0) {
        player_went_north = 1;
        //show_debug_message("NORTH");
    } 
    if (player_went_north == 1 && player_went_south == 1) {
        player_went_north = 0;
        player_went_south = 0;
    }
    if (player_went_east == 1 && player_went_west == 1) {
        player_went_west = 0;
        player_went_south = 0;
    }
    if(player_went_east == 1 && !(prev_x > 800 && x < 0)) {
        image_angle = point_direction(x,y,900,player_obj.y);
        direction = point_direction(x,y,900,player_obj.y);
    } else if (player_went_west == 1 && !(prev_x < 0 && x > 800)) {
        image_angle = point_direction(x,y,-100,player_obj.y);
        direction = point_direction(x,y,-100,player_obj.y);
    }
    //Unfortunately due to the fact that GML is retarded with looping,
    //I have to make this ridiculous conditional statement 
    else if (player_went_south == 1 && 
    !(
    (prev_y > 800 && y < 0) || 
    (prev_y > 800 && (y > 0 && y < 800))
    )) {
        image_angle = point_direction(x,y,player_obj.x,900);
        direction = point_direction(x,y,player_obj.x,900);
    } 
    else if (player_went_north == 1 && 
    !(
    (prev_y < 0 && y > 800) || 
    (prev_y < 0 && (y < 800 && y > 0))
    )) {
        image_angle = point_direction(x,y,player_obj.x,-100);
        direction = point_direction(x,y,player_obj.x,-100);
    } else {
        image_angle = point_direction(x,y,player_obj.x,player_obj.y);
        direction = point_direction(x,y,player_obj.x,player_obj.y);
        player_went_east = 0;
        player_went_west = 0;
        player_went_north = 0;
        player_went_south = 0;
        if(player_obj.x < x) {
            image_yscale = -1;
        } else {
            image_yscale = 1;
        }
    }
    player_prev_x = player_obj.x;
    player_prev_y = player_obj.y;
    prev_x = x;
    prev_y = y;
}
