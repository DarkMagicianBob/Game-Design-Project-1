player_reference = argument[0];
boots = argument[1];
with(player_reference)
{
    effect_create_above(ef_smoke, player_reference.x, player_reference.y, 32, c_white);
    player_reference.x += lengthdir_x(200, player_reference.direction);
    player_reference.y += lengthdir_y(200, player_reference.direction);
    audio_play_sound(blink1,10,false);
    effect_create_above(ef_smoke, player_reference.x, player_reference.y, 32, c_white);
    show_debug_message("durability: " + string(boots.durability));
}
