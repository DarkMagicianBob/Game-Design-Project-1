agent = argument[0];
projectile = argument[1];
count= 0;
//show_debug_message(string(projectile.x) + " " + string(projectile.y));

switch(projectile.type)
{
    case("standard"):
        //Do standard damage to agent and delete projectile
        show_debug_message("Recognized standard collision case");
        agent.mon_health -= projectile.projectile_power + global.pwr;
        with (projectile) { instance_destroy();}
        break;
        
    case("knockback"):
        //Push the enemy back and maybe do damage
        show_debug_message("Recognized knockback collision case");
        agent.x += lengthdir_x(projectile.projectile_power, projectile.direction); // testing at the moment with 20
        agent.y += lengthdir_y(projectile.projectile_power, projectile.direction);
        agent.mon_health -= projectile.damage;
        with (projectile) { instance_destroy();}
        break;
        
    case("explosion"):
        // create a radius around collision and do damage to everything in it
        // currently having an issue with accessing shared memory it seems
        show_debug_message("Recognized explosion collision case");
        show_debug_message(string(instance_number(enemy_obj)));
        for (i = 0; i < instance_number(enemy_obj); i += 1)
        {
            enemy = instance_find(enemy_obj,i);
            if (point_distance(enemy.x,enemy.y,projectile.x,projectile.y) < 1000)
               {
               enemy.mon_health -= projectile.damage;
               show_debug_message("exploded enemy: " + string(enemy.id));
               }
        }
        with (projectile) { instance_destroy();}
        break;
    
}
    
