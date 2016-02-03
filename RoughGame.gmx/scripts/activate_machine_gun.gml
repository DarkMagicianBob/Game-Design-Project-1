
player_reference = argument[0];
gun = argument[1];
with(player_reference)
{
    bullet = instance_create(x,y,bullet_obj);
    bullet.speed = 20;
    bullet.damage = 1;
    bullet.direction = image_angle;
    bullet.image_angle = self.image_angle;
    audio_play_sound(arrow_whish,10,false);
    show_debug_message("durability: " + string(gun.durability));
}
return bullet;

