player_reference = argument[0];
gun = argument[1];
with(player_reference)
{
    bullet_0 = instance_create(x,y,arrow_obj);
    bullet_0.speed = 20;
    bullet_0.projectile_power += global.pwr;
    bullet_0.effect = true;
    bullet_0.direction = image_angle;
    bullet_0.image_angle = self.image_angle;
    
    bullet_1 = instance_create(x,y,arrow_obj);
    bullet_1.speed = 20;
    bullet_1.projectile_power += global.pwr;
    bullet_1.effect = true;
    bullet_1.direction = image_angle + 45;
    bullet_1.image_angle = self.image_angle + 45;
    
    bullet_2 = instance_create(x,y,arrow_obj);
    bullet_2.speed = 20;
    bullet_2.projectile_power += global.pwr;
    bullet_2.effect = true;
    bullet_2.direction = image_angle - 45;
    bullet_2.image_angle = self.image_angle - 45;
    
    
    audio_play_sound(arrow_whish,10,false);
    show_debug_message("durability: " + string(gun.durability));
}
//return bullet;
