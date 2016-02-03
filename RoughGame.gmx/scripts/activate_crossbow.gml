player_reference = argument[0];
crossbow = argument[1];
with(player_reference)
{
    shot_arrow = instance_create(x,y,arrow_obj);
    shot_arrow.speed = 20;
    shot_arrow.direction = image_angle;
    shot_arrow.image_angle = self.image_angle;
    audio_play_sound(arrow_whish,10,false);
    show_debug_message("durability: " + string(crossbow.durability));
}

return shot_arrow;
