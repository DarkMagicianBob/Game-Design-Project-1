agent = argument[0];
projectile = argument[1];
count= 0;
//show_debug_message(string(projectile.x) + " " + string(projectile.y));

switch(projectile.type)
{
    case("standard"):
        //Do standard damage to agent and delete projectile
        show_debug_message("Recognized standard case");
        agent.mon_health -= projectile.damage;
        with (projectile) { instance_destroy();}
        break;
        
    case("knockback"):
        //Push the enemy back and maybe do damage
        agent.x += lengthdir_x(projectile.projectile_power, projectile.direction); // testing at the moment with 20
        agent.y += lengthdir_y(projectile.projectile_power, projectile.direction);
        agent.mon_health -= projectile.damage;
        with (projectile) { instance_destroy();}
        break;
        
    case("explosion"):
        // create a radius around collision and do damage to everything in it
        // currently having an issue with accessing shared memory it seems
        with(enemy_object)
        {
            if collision_circle(400, 400, 200, id, false, true)
               {
               count += 1;
               show_debug_message("Count of exploded objects: " + string(count));
               }
        }
        break;
    
}
    
